// Application layer model that combines data from multiple base models
// src/models/domain/note_with_category.dart

// Domain model representing a Note with its Categories
import 'package:test/brick/models/note.model.dart';

class Note {
  final String id;
  final String content;
  final String createdAt;
  final String userId;
  final List<Category> categories;

  Note({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.userId,
    this.categories = const [],
  });

  // Factory constructor to create from base NoteRow
  factory Note.fromRow(NoteRow model, {List<Category> categories = const []}) {
    return Note(
      id: model.id,
      content: model.content,
      createdAt: model.createdAt,
      userId: model.userId,
      categories: categories,
    );
  }

  // Create a base NoteRow from this domain model
  NoteRow toRow() {
    return NoteRow(
      id: id,
      content: content,
      createdAt: createdAt,
      userId: userId,
    );
  }
}

// Domain model for Category
class Category {
  final String id;
  final String name;
  final String createdAt;
  final String noteId;

  Category({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.noteId,
  });

  // Factory constructor to create from base CategoryRow
  factory Category.fromModel(CategoryRow model) {
    return Category(
      id: model.id,
      name: model.name,
      createdAt: model.createdAt,
      noteId: model.noteId,
    );
  }

  // Create a base CategoryRow from this domain model
  CategoryRow toModel() {
    return CategoryRow(
      id: id,
      name: name,
      createdAt: createdAt,
      noteId: noteId,
    );
  }
}
