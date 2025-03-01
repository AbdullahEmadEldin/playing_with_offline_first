import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';
import 'package:uuid/uuid.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'notes'),
)
class NoteRow extends OfflineFirstWithSupabaseModel {
  final String content;
  @Supabase(name: 'created_at')
  final String createdAt;

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'user_id')
  @Sqlite(name: 'user_id')
  final String userId;

  NoteRow({
    String? id,
    required this.createdAt,
    required this.content,
    required this.userId,
  }) : id = id ?? const Uuid().v4();
}

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'category'),
)
class CategoryRow extends OfflineFirstWithSupabaseModel {
  final String name;
  @Supabase(name: 'created_at')
  final String createdAt;

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final String id;

  @Supabase(name: 'note_id')
  @Sqlite(name: 'note_id')
  final String noteId;

  CategoryRow({
    String? id,
    required this.createdAt,
    required this.name,
    required this.noteId,
  }) : id = id ?? const Uuid().v4();
}
