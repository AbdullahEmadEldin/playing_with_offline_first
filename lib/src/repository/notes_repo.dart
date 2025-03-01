// Service layer to handle operations on domain models
// src/services/note_service.dart

import 'dart:developer';

import 'package:brick_core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/brick/models/note.model.dart';
import 'package:test/brick/models/test_item.model.dart';
import 'package:test/brick/repository.dart';

import '../models/note_model.dart';

class NoteService {
  final Repository _repository = Repository();

  // Get all notes with their categories
  Future<List<Note>> getAllNotes() async {
    // Fetch all notes from the repository
    final noteRows = await _repository.get<NoteRow>();

    // Create a map to hold notes with their categories
    final Map<String, Note> notesMap = {};

    // Initialize all notes without categories first
    for (final noteRow in noteRows) {
      notesMap[noteRow.id] = Note.fromRow(noteRow);
    }

    // Fetch all categories
    final categoryRows = await _repository.get<CategoryRow>();

    // Group categories by note ID
    for (final categoryRow in categoryRows) {
      final noteId = categoryRow.noteId;

      // If we have the note in our map, add this category to it
      if (notesMap.containsKey(noteId)) {
        final note = notesMap[noteId]!;
        final updatedCategories = List<Category>.from(note.categories)
          ..add(Category.fromModel(categoryRow));

        // Replace the note with an updated version that includes this category
        notesMap[noteId] = Note(
          id: note.id,
          content: note.content,
          createdAt: note.createdAt,
          userId: note.userId,
          categories: updatedCategories,
        );
      }
    }

    // Return the list of notes with their categories
    return notesMap.values.toList();
  }

  // Get a single note with its categories by ID
  Future<Note?> getNoteById(String id) async {
    // Get the note
    final noteRows = await _repository.get<NoteRow>(
      query: Query.where('id', id, limit1: true),
    );

    if (noteRows.isEmpty) {
      return null;
    }

    final noteRow = noteRows.first;

    // Get categories for this note
    final categoryRow = await _repository.get<CategoryRow>(
      query: Query.where('noteId', id),
    );

    // Convert to domain models
    final categories =
        categoryRow.map((model) => Category.fromModel(model)).toList();

    // Create and return the domain note with its categories
    return Note.fromRow(noteRow, categories: categories);
  }

  // Create a new note with categories
  Future<Note> createNote(
      String content, String userId, List<String> categoryNames) async {
    // Create the note model
    final noteRow = NoteRow(
      content: content,
      createdAt: DateTime.now().toIso8601String(),
      userId: userId,
    );

    // Save the note to get its ID
    final savedNoteRow = await _repository.upsert<NoteRow>(noteRow);

    // Create categories
    final categories = <Category>[];
    for (final name in categoryNames) {
      final categoryModel = CategoryRow(
        name: name,
        createdAt: DateTime.now().toIso8601String(),
        noteId: savedNoteRow.id,
      );

      // Save the category
      final savedCategoryModel =
          await _repository.upsert<CategoryRow>(categoryModel);
      categories.add(Category.fromModel(savedCategoryModel));
    }

    // Return the domain model
    return Note.fromRow(savedNoteRow, categories: categories);
  }

  // Delete a note and all its categories
  Future<void> deleteNote(String noteId) async {
    // First get all categories for this note
    final categoryRow = await _repository.get<CategoryRow>(
      query: Query.where('noteId', noteId),
    );

    // Delete all categories
    for (final category in categoryRow) {
      await _repository.delete<CategoryRow>(category);
    }

    // Get the note
    final noteRows = await _repository.get<NoteRow>(
      query: Query.where('id', noteId, limit1: true),
    );

    if (noteRows.isNotEmpty) {
      // Delete the note
      await _repository.delete<NoteRow>(noteRows.first);
    }
  }

  Future<TestItem> saveTestItem(TestItem item) async {
    // If id is -1, this is a new record, so we'll use a custom approach
    if (item.id == -1) {
      // Execute a direct Supabase insert that will generate the ID
      final response = await Supabase.instance.client
          .from('test_item')
          .insert({
            'name': item.name,
            'created_at': item.createdAt ?? DateTime.now().toIso8601String(),
          })
          .select()
          .single();

      // Create a new TestItem with the ID from Supabase
      final newItem = TestItem(
        id: response['id'],
        name: item.name,
        createdAt: item.createdAt,
      );
      return _repository.upsert<TestItem>(newItem);
    } else {
      // For existing records, use normal upsert
      return await _repository.upsert<TestItem>(item);
    }
  }

  Future<List<TestItem>> getTestItems() async {
    final items = await _repository.get<TestItem>();
    log('=!!!!!!!!!!!');
    items.map((item) => log('==> ${item.id} -- ${item.name}')).toList();
    return items;
  }
}
