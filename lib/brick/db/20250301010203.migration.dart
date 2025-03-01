// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250301010203_up = [
  InsertTable('NoteRow'),
  InsertTable('CategoryRow'),
  InsertColumn('content', Column.varchar, onTable: 'NoteRow'),
  InsertColumn('created_at', Column.varchar, onTable: 'NoteRow'),
  InsertColumn('id', Column.varchar, onTable: 'NoteRow', unique: true),
  InsertColumn('user_id', Column.varchar, onTable: 'NoteRow'),
  InsertColumn('name', Column.varchar, onTable: 'CategoryRow'),
  InsertColumn('created_at', Column.varchar, onTable: 'CategoryRow'),
  InsertColumn('id', Column.varchar, onTable: 'CategoryRow', unique: true),
  InsertColumn('note_id', Column.varchar, onTable: 'CategoryRow'),
  CreateIndex(columns: ['id'], onTable: 'NoteRow', unique: true),
  CreateIndex(columns: ['id'], onTable: 'CategoryRow', unique: true)
];

const List<MigrationCommand> _migration_20250301010203_down = [
  DropTable('NoteRow'),
  DropTable('CategoryRow'),
  DropColumn('content', onTable: 'NoteRow'),
  DropColumn('created_at', onTable: 'NoteRow'),
  DropColumn('id', onTable: 'NoteRow'),
  DropColumn('user_id', onTable: 'NoteRow'),
  DropColumn('name', onTable: 'CategoryRow'),
  DropColumn('created_at', onTable: 'CategoryRow'),
  DropColumn('id', onTable: 'CategoryRow'),
  DropColumn('note_id', onTable: 'CategoryRow'),
  DropIndex('index_NoteRow_on_id'),
  DropIndex('index_CategoryRow_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250301010203',
  up: _migration_20250301010203_up,
  down: _migration_20250301010203_down,
)
class Migration20250301010203 extends Migration {
  const Migration20250301010203()
    : super(
        version: 20250301010203,
        up: _migration_20250301010203_up,
        down: _migration_20250301010203_down,
      );
}
