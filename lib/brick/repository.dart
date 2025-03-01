// Saved in my_app/lib/src/brick/repository.dart
import 'package:brick_offline_first_with_supabase/brick_offline_first_with_supabase.dart';
import 'package:brick_sqlite/brick_sqlite.dart';
import 'package:brick_sqlite/memory_cache_provider.dart';
// This hide is for Brick's @Supabase annotation; in most cases,
// supabase_flutter **will not** be imported in application code.
import 'package:brick_supabase/brick_supabase.dart' hide Supabase;
import 'package:sqflite_common/sqlite_api.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/brick/db/schema.g.dart';

import 'brick.g.dart';

class Repository extends OfflineFirstWithSupabaseRepository {
  static late Repository? _instance;

  Repository._({
    required super.supabaseProvider,
    required super.sqliteProvider,
    required super.migrations,
    required super.offlineRequestQueue,
    super.memoryCacheProvider,
  });

  factory Repository() => _instance!;

  static Future<void> configure(DatabaseFactory databaseFactory) async {
    final (client, queue) = OfflineFirstWithSupabaseRepository.clientQueue(
      databaseFactory: databaseFactory,
      ignorePaths: {},
    );

    await Supabase.initialize(
      url: 'https://jqvhksflcdtbnzxfzpag.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Impxdmhrc2ZsY2R0Ym56eGZ6cGFnIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA1MjczNTUsImV4cCI6MjA1NjEwMzM1NX0.FChaAgt-N7wPuqsLa4DebFwrYFvCe2bVySX5ZZwCJXc',
      httpClient: client,
    );

    final provider = SupabaseProvider(
      Supabase.instance.client,
      modelDictionary: supabaseModelDictionary,
    );

    _instance = Repository._(
      supabaseProvider: provider,
      sqliteProvider: SqliteProvider(
        'my_repository.sqlite',
        databaseFactory: databaseFactory,
        modelDictionary: sqliteModelDictionary,
      ),
      migrations: migrations,
      offlineRequestQueue: queue,
      // Specify class types that should be cached in memory
      memoryCacheProvider: MemoryCacheProvider(),
    );
  }
}
