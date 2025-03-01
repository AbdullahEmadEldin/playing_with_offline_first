import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_supabase/brick_supabase.dart';

@ConnectOfflineFirstWithSupabase(
  supabaseConfig: SupabaseSerializable(tableName: 'test_item'),
)
class TestItem extends OfflineFirstWithSupabaseModel {
  final String name;

  @Supabase(name: 'created_at')
  final String? createdAt;

  @Supabase(unique: true)
  @Sqlite(index: true, unique: true)
  final int id;

  TestItem({
    required this.name,
    this.createdAt,
    this.id = -1, // Use -1 to indicate a new record
  });
}
