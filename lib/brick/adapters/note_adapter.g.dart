// GENERATED CODE DO NOT EDIT
part of '../brick.g.dart';

Future<Note> _$NoteFromSupabase(
  Map<String, dynamic> data, {
  required SupabaseProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Note(
    content: data['content'] as String,
    createdAt: data['created_at'] as String,
    id: data['id'] as String?,
    userId: data['user_id'] as String,
    category:
        data['category'] == null
            ? null
            : await Future.wait<Category>(
              data['category']
                      ?.map(
                        (d) => CategoryAdapter().fromSupabase(
                          d,
                          provider: provider,
                          repository: repository,
                        ),
                      )
                      .toList()
                      .cast<Future<Category>>() ??
                  [],
            ),
  );
}

Future<Map<String, dynamic>> _$NoteToSupabase(
  Note instance, {
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

Future<Note> _$NoteFromSqlite(
  Map<String, dynamic> data, {
  required SqliteProvider provider,
  OfflineFirstWithSupabaseRepository? repository,
}) async {
  return Note(
    content: data['content'] as String,
    createdAt: data['created_at'] as String,
    id: data['id'] as String,
    userId: data['user_id'] as String,
    category:
        (await provider
            .rawQuery(
              'SELECT DISTINCT `f_Category_brick_id` FROM `_brick_Note_category` WHERE l_Note_brick_id = ?',
              [data['_brick_id'] as int],
            )
            .then((results) {
              final ids = results.map((r) => r['f_Category_brick_id']);
              return Future.wait<Category>(
                ids.map(
                  (primaryKey) => repository!
                      .getAssociation<Category>(
                        Query.where('primaryKey', primaryKey, limit1: true),
                      )
                      .then((r) => r!.first),
                ),
              );
            })).toList().cast<Category>(),
  )..primaryKey = data['_brick_id'] as int;
}

Future<Map<String, dynamic>> _$NoteToSqlite(
  Note instance, {
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

/// Construct a [Note]
class NoteAdapter extends OfflineFirstWithSupabaseAdapter<Note> {
  NoteAdapter();

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
    'category': const RuntimeSupabaseColumnDefinition(
      association: true,
      columnName: 'category',
      associationType: Category,
      associationIsNullable: true,
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
    'category': const RuntimeSqliteColumnDefinition(
      association: true,
      columnName: 'category',
      iterable: true,
      type: Category,
    ),
  };
  @override
  Future<int?> primaryKeyByUniqueColumns(
    Note instance,
    DatabaseExecutor executor,
  ) async {
    final results = await executor.rawQuery(
      '''
        SELECT * FROM `Note` WHERE id = ? LIMIT 1''',
      [instance.id],
    );

    // SQFlite returns [{}] when no results are found
    if (results.isEmpty || (results.length == 1 && results.first.isEmpty)) {
      return null;
    }

    return results.first['_brick_id'] as int;
  }

  @override
  final String tableName = 'Note';
  @override
  Future<void> afterSave(instance, {required provider, repository}) async {
    if (instance.primaryKey != null) {
      final categoryOldColumns = await provider.rawQuery(
        'SELECT `f_Category_brick_id` FROM `_brick_Note_category` WHERE `l_Note_brick_id` = ?',
        [instance.primaryKey],
      );
      final categoryOldIds = categoryOldColumns.map(
        (a) => a['f_Category_brick_id'],
      );
      final categoryNewIds =
          instance.category?.map((s) => s.primaryKey).whereType<int>() ?? [];
      final categoryIdsToDelete = categoryOldIds.where(
        (id) => !categoryNewIds.contains(id),
      );

      await Future.wait<void>(
        categoryIdsToDelete.map((id) async {
          return await provider
              .rawExecute(
                'DELETE FROM `_brick_Note_category` WHERE `l_Note_brick_id` = ? AND `f_Category_brick_id` = ?',
                [instance.primaryKey, id],
              )
              .catchError((e) => null);
        }),
      );

      await Future.wait<int?>(
        instance.category?.map((s) async {
              final id =
                  s.primaryKey ??
                  await provider.upsert<Category>(s, repository: repository);
              return await provider.rawInsert(
                'INSERT OR IGNORE INTO `_brick_Note_category` (`l_Note_brick_id`, `f_Category_brick_id`) VALUES (?, ?)',
                [instance.primaryKey, id],
              );
            }) ??
            [],
      );
    }
  }

  @override
  Future<Note> fromSupabase(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async => await _$NoteFromSupabase(
    input,
    provider: provider,
    repository: repository,
  );
  @override
  Future<Map<String, dynamic>> toSupabase(
    Note input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async =>
      await _$NoteToSupabase(input, provider: provider, repository: repository);
  @override
  Future<Note> fromSqlite(
    Map<String, dynamic> input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async =>
      await _$NoteFromSqlite(input, provider: provider, repository: repository);
  @override
  Future<Map<String, dynamic>> toSqlite(
    Note input, {
    required provider,
    covariant OfflineFirstWithSupabaseRepository? repository,
  }) async =>
      await _$NoteToSqlite(input, provider: provider, repository: repository);
}
