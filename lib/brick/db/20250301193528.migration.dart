// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250301193528_up = [
  InsertTable('TestItem'),
  InsertColumn('name', Column.varchar, onTable: 'TestItem'),
  InsertColumn('created_at', Column.varchar, onTable: 'TestItem'),
  InsertColumn('id', Column.integer, onTable: 'TestItem', unique: true),
  CreateIndex(columns: ['id'], onTable: 'TestItem', unique: true)
];

const List<MigrationCommand> _migration_20250301193528_down = [
  DropTable('TestItem'),
  DropColumn('name', onTable: 'TestItem'),
  DropColumn('created_at', onTable: 'TestItem'),
  DropColumn('id', onTable: 'TestItem'),
  DropIndex('index_TestItem_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250301193528',
  up: _migration_20250301193528_up,
  down: _migration_20250301193528_down,
)
class Migration20250301193528 extends Migration {
  const Migration20250301193528()
    : super(
        version: 20250301193528,
        up: _migration_20250301193528_up,
        down: _migration_20250301193528_down,
      );
}
