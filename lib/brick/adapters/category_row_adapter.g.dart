// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<CategoryRow> _$CategoryRowFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return CategoryRow(
    name: data['name'] as String,
    createdAt: data['created_at'] as String,
    id: data['id'] as String?,
    noteId: data['note_id'] as String,
  );
}

Future<Map<String, dynamic>> _$CategoryRowToSupabase(
  CategoryRow instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'name': instance.name,
    'created_at': instance.createdAt,
    'id': instance.id,
    'note_id': instance.noteId,
  };
}

Future<CategoryRow> _$CategoryRowFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return CategoryRow(
    name: data['name'] as String,
    createdAt: data['created_at'] as String,
    id: data['id'] as String,
    noteId: data['note_id'] as String,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$CategoryRowToSqlite(
  CategoryRow instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'name': instance.name,
    'created_at': instance.createdAt,
    'id': instance.id,
    'note_id': instance.noteId,
  };
}

/// Construct a [CategoryRow]
class CategoryRowAdapter extends OfflineFirstWithSupabaseAdapter<CategoryRow> {
  CategoryRowAdapter();

  @override
  final supabaseTableName = 'category';
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
    'noteId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'note_id',
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
      type: String,
    ),
    'noteId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'note_id',
      iterable: false,
      type: String,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    CategoryRow instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `CategoryRow` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'CategoryRow';

  @override
  Future<CategoryRow> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryRowFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    CategoryRow input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryRowToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<CategoryRow> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryRowFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    CategoryRow input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$CategoryRowToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
