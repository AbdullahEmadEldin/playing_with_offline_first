// GENERATED CODE DO NOT EDIT
// This file should be version controlled
import 'package:brick_sqlite/db.dart';
part '20250301010203.migration.dart';
part '20250301193528.migration.dart';
part '20250301194323.migration.dart';
part '20250301194716.migration.dart';

/// All intelligently-generated migrations from all `@Migratable` classes on disk
final migrations = <Migration>{
  const Migration20250301010203(),
  const Migration20250301193528(),
  const Migration20250301194323(),
  const Migration20250301194716(),
};

/// A consumable database structure including the latest generated migration.
final schema = Schema(
  20250301194716,
  generatorVersion: 1,
  tables: <SchemaTable>{
    SchemaTable(
      'NoteRow',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn('content', Column.varchar),
        SchemaColumn('created_at', Column.varchar),
        SchemaColumn('id', Column.varchar, unique: true),
        SchemaColumn('user_id', Column.varchar),
      },
      indices: <SchemaIndex>{
        SchemaIndex(columns: ['id'], unique: true),
      },
    ),
    SchemaTable(
      'CategoryRow',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn('name', Column.varchar),
        SchemaColumn('created_at', Column.varchar),
        SchemaColumn('id', Column.varchar, unique: true),
        SchemaColumn('note_id', Column.varchar),
      },
      indices: <SchemaIndex>{
        SchemaIndex(columns: ['id'], unique: true),
      },
    ),
    SchemaTable(
      'TestItem',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn('name', Column.varchar),
        SchemaColumn('created_at', Column.varchar),
        SchemaColumn('id', Column.integer, unique: true),
      },
      indices: <SchemaIndex>{
        SchemaIndex(columns: ['id'], unique: true),
      },
    ),
  },
);
