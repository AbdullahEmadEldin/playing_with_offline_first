// Service layer to handle operations on domain models
// src/services/note_service.dart

import 'dart:developer';

import 'package:brick_core/core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/brick/models/note.model.dart';
import 'package:test/brick/models/test_item.model.dart';
import 'package:test/brick/repository.dart';

class NoteService {
  final Repository _repository = Repository();

  // Create a new note with categories
  Future<void> createNote(
      String content, String userId, String categoryNames) async {
    // Create the note model
    final noteRow = Note(
      content: content,
      createdAt: DateTime.now().toIso8601String(),
      userId: userId,
    );
    try {
      final savedNote = await _repository.upsert<Note>(noteRow);
      log('=======!======== ${savedNote.toJson()} ===============');
      final Category category = Category(
        noteId: savedNote.id,
        name: categoryNames,
        createdAt: DateTime.now().toIso8601String(),
      );
      _repository.upsert<Category>(category);
    } catch (e) {
      log('!!!! $e ===============');
    }
    // Save the note to get its ID

    // Return the domain model
  }

  // get notes
  Future<List<Note>> getNotes() async {
    // edit policy manually as  [OfflineFirstGetPolicy] not recognized form brick_offline_first_with_supabase
    // I don't know WHY ??!
    final rows = await _repository.get<Note>();
    log('======================= ${rows.length} ===============');
    return rows;
  }

  // Delete a note and all its categories
  Future<void> deleteNote(String noteId) async {
    // First get all categories for this note
    final category = await _repository.get<Category>(
      query: Query.where('noteId', noteId),
    );

    // Delete all categories
    for (final category in category) {
      await _repository.delete<Category>(category);
    }

    // Get the note
    final noteRows = await _repository.get<Note>(
      query: Query.where('id', noteId, limit1: true),
    );

    if (noteRows.isNotEmpty) {
      // Delete the note
      await _repository.delete<Note>(noteRows.first);
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
