// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<NoteRow> _$NoteRowFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return NoteRow(
    content: data['content'] as String,
    createdAt: data['created_at'] as String,
    id: data['id'] as String?,
    userId: data['user_id'] as String,
  );
}

Future<Map<String, dynamic>> _$NoteRowToSupabase(
  NoteRow instance, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'content': instance.content,
    'created_at': instance.createdAt,
    'id': instance.id,
    'user_id': instance.userId,
  };
}

Future<NoteRow> _$NoteRowFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return NoteRow(
    content: data['content'] as String,
    createdAt: data['created_at'] as String,
    id: data['id'] as String,
    userId: data['user_id'] as String,
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$NoteRowToSqlite(
  NoteRow instance, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return {
    'content': instance.content,
    'created_at': instance.createdAt,
    'id': instance.id,
    'user_id': instance.userId,
  };
}

/// Construct a [NoteRow]
class NoteRowAdapter extends OfflineFirstWithSupabaseAdapter<NoteRow> {
  NoteRowAdapter();

  @override
  final supabaseTableName = 'notes';
  @override
  final defaultToNull = true;
  @override
  final fieldsToSupabaseColumns = {
    'content': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'content',
    ),
    'createdAt': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'created_at',
    ),
    'id': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'id',
    ),
    'userId': const RuntimeSupabaseColumnDefinition(
      association: false,
      columnName: 'user_id',
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
    'content': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'content',
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
    'userId': const RuntimeSqliteColumnDefinition(
      association: false,
      columnName: 'user_id',
      iterable: false,
      type: String,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    NoteRow instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `NoteRow` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'NoteRow';

  @override
  Future<NoteRow> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$NoteRowFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    NoteRow input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$NoteRowToSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<NoteRow> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$NoteRowFromSqlite(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSqlite(
    NoteRow input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$NoteRowToSqlite(
    input,
    provider: provider,
    repository: repository,
  );
}
