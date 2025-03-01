// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<TestItem> _$TestItemFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return TestItem(
    name: data['name'] as String,
    createdAt:
        data['created_at'] == null ? null : data['created_at'] as String?,
    id: data['id'] as int,
  );
}

Future<Map<String, dynamic>> _$TestItemToSupabase(
  TestItem instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'name': instance.name,
    'created_at': instance.createdAt,
    'id': instance.id,
  };
}

Future<TestItem> _$TestItemFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return TestItem(
    name: data['name'] as String,
    createdAt:
        data['created_at'] == null ? null : data['created_at'] as String?,
    id: data['id'] as int,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$TestItemToSqlite(
  TestItem instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'name': instance.name,
    'created_at': instance.createdAt,
    'id': instance.id,
  };
}

/// Construct a [TestItem]
class TestItemAdapter extends OfflineFirstWithSupabaseAdapter<TestItem> {
  TestItemAdapter();

  @override
  final supabaseTableName = 'test_item';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'name': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'name',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    ),
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
  };
  @override
  final ignoreDuplicates = false;
  @override
  final uniqueFields = {'id'};
  @override
  final Map<String, RuntimeSqliteColumnDefinition> fieldsToSqliteColumns = {
    'primaryKey': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: '_brick_id',
      iterable: false,
      type: int,
    ),
    'name': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'name',
      iterable: false,
      type: String,
    ),
    'createdAt': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'created_at',
      iterable: false,
      type: String,
    ),
    'id': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'id',
      iterable: false,
      type: int,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    TestItem instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `TestItem` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'TestItem';

  @override
  Future<TestItem> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$TestItemFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    TestItem input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$TestItemToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<TestItem> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$TestItemFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    TestItem input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$TestItemToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
