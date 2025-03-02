// GENERATED CODE DO NOT EDIT
// This file should be version controlled
import 'package:brick_sqlite/db.dart';
part '20250302041715.migration.dart';

/// All intelligently-generated migrations from all `@Migratable` classes on disk
final migrations = <Migration>{
  const Migration20250302041715(),};

/// A consumable database structure including the latest generated migration.
final schema = Schema(
  0,
  generatorVersion: 1,
  tables: <SchemaTable>{
    SchemaTable(
      '_brick_Note_category',
      columns: <SchemaColumn>{
        SchemaColumn(
          '_brick_id',
          Column.integer,
          autoincrement: true,
          nullable: false,
          isPrimaryKey: true,
        ),
        SchemaColumn(
          'l_Note_brick_id',
          Column.integer,
          isForeignKey: true,
          foreignTableName: 'Note',
          onDeleteCascade: true,
          onDeleteSetDefault: false,
        ),
        SchemaColumn(
          'f_Category_brick_id',
          Column.integer,
          isForeignKey: true,
          foreignTableName: 'Category',
          onDeleteCascade: true,
          onDeleteSetDefault: false,
        ),
      },
      indices: <SchemaIndex>{
        SchemaIndex(
          columns: ['l_Note_brick_id', 'f_Category_brick_id'],
          unique: true,
        ),
      },
    ),
    SchemaTable(
      'Note',
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
      'Category',
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
