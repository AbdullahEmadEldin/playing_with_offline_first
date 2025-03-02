// GENERATED CODE EDIT WITH CAUTION
// THIS FILE **WILL NOT** BE REGENERATED
// This file should be version controlled and can be manually edited.
part of 'schema.g.dart';

// While migrations are intelligently created, the difference between some commands, such as
// DropTable vs. RenameTable, cannot be determined. For this reason, please review migrations after
// they are created to ensure the correct inference was made.

// The migration version must **always** mirror the file name

const List<MigrationCommand> _migration_20250302041715_up = [
  InsertTable('_brick_Note_category'),
  InsertTable('Note'),
  InsertTable('Category'),
  InsertTable('TestItem'),
  InsertForeignKey('_brick_Note_category', 'Note', foreignKeyColumn: 'l_Note_brick_id', onDeleteCascade: true, onDeleteSetDefault: false),
  InsertForeignKey('_brick_Note_category', 'Category', foreignKeyColumn: 'f_Category_brick_id', onDeleteCascade: true, onDeleteSetDefault: false),
  InsertColumn('content', Column.varchar, onTable: 'Note'),
  InsertColumn('created_at', Column.varchar, onTable: 'Note'),
  InsertColumn('id', Column.varchar, onTable: 'Note', unique: true),
  InsertColumn('user_id', Column.varchar, onTable: 'Note'),
  InsertColumn('name', Column.varchar, onTable: 'Category'),
  InsertColumn('created_at', Column.varchar, onTable: 'Category'),
  InsertColumn('id', Column.varchar, onTable: 'Category', unique: true),
  InsertColumn('note_id', Column.varchar, onTable: 'Category'),
  InsertColumn('name', Column.varchar, onTable: 'TestItem'),
  InsertColumn('created_at', Column.varchar, onTable: 'TestItem'),
  InsertColumn('id', Column.integer, onTable: 'TestItem', unique: true),
  CreateIndex(columns: ['l_Note_brick_id', 'f_Category_brick_id'], onTable: '_brick_Note_category', unique: true),
  CreateIndex(columns: ['id'], onTable: 'Note', unique: true),
  CreateIndex(columns: ['id'], onTable: 'Category', unique: true),
  CreateIndex(columns: ['id'], onTable: 'TestItem', unique: true)
];

const List<MigrationCommand> _migration_20250302041715_down = [
  DropTable('_brick_Note_category'),
  DropTable('Note'),
  DropTable('Category'),
  DropTable('TestItem'),
  DropColumn('l_Note_brick_id', onTable: '_brick_Note_category'),
  DropColumn('f_Category_brick_id', onTable: '_brick_Note_category'),
  DropColumn('content', onTable: 'Note'),
  DropColumn('created_at', onTable: 'Note'),
  DropColumn('id', onTable: 'Note'),
  DropColumn('user_id', onTable: 'Note'),
  DropColumn('name', onTable: 'Category'),
  DropColumn('created_at', onTable: 'Category'),
  DropColumn('id', onTable: 'Category'),
  DropColumn('note_id', onTable: 'Category'),
  DropColumn('name', onTable: 'TestItem'),
  DropColumn('created_at', onTable: 'TestItem'),
  DropColumn('id', onTable: 'TestItem'),
  DropIndex('index__brick_Note_category_on_l_Note_brick_id_f_Category_brick_id'),
  DropIndex('index_Note_on_id'),
  DropIndex('index_Category_on_id'),
  DropIndex('index_TestItem_on_id')
];

//
// DO NOT EDIT BELOW THIS LINE
//

@Migratable(
  version: '20250302041715',
  up: _migration_20250302041715_up,
  down: _migration_20250302041715_down,
)
class Migration20250302041715 extends Migration {
  const Migration20250302041715()
    : super(
        version: 20250302041715,
        up: _migration_20250302041715_up,
        down: _migration_20250302041715_down,
      );
}
