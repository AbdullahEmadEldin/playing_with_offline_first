import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'notes'),
)
class Note extends OfflineFirstWithSupabaseModel {
  final String content;
  @Supabase(name: 'created_at')
  final String createdAt;

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'user_id')
  @Sqlite(name: 'user_id')
  final String userId;

  @Supabase(ignoreTo: true)
  final List<Category>? category;

  Note({
    String? id,
    required this.createdAt,
    required this.content,
    required this.userId,
    this.category,
  }) : id = id ?? const Uuid().v4();

  //to json
  Map<String, dynamic> toJson() => {
        'content': content,
        'created_at': createdAt,
        'id': id,
        'user_id': userId,
        'category': category,
      };

  //from json
}

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'category'),
)
class Category extends OfflineFirstWithSupabaseModel {
  final String name;
  @Supabase(name: 'created_at')
  final String createdAt;

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(foreignKey: 'note_id')
  final String noteId;

  Category({
    String? id,
    required this.createdAt,
    required this.name,
    required this.noteId,
  }) : id = id ?? const Uuid().v4();
}
