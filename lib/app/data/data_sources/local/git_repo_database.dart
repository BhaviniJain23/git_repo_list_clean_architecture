import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:ailoitte/app/data/data_sources/local/entities/item_table.dart';
import 'package:ailoitte/app/data/data_sources/local/entities/license_table.dart';
import 'package:ailoitte/app/data/data_sources/local/entities/owner_table.dart';
import 'package:ailoitte/app/data/data_sources/local/entities/topic_table.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

abstract class AbstractDatabase {
  Future<Database> get database;
  Future<void> initDatabase();
  Future<void> closeDatabase();
}

class SqliteDatabaseHelper implements AbstractDatabase {
  static const _databaseName = 'My_database.db';
  static const _databaseVersion = 1;

  Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) {
      print('Database already initialized');
      return _database!;
    }
    print('Initializing database...');
    _database = await initDatabase();
    print('Database initialized');
    return _database!;
  }

  @override
  Future<Database> initDatabase() async {
    print('Initializing database...');
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(documentsDirectory.path, _databaseName);
    print('Database path: $dbPath');
    Database db = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    await _onCreate(db, _databaseVersion); // Ensure tables are created
    return db;
  }

  @override
  Future<void> closeDatabase() async {
    if (_database != null) {
      print('Closing database...');
      await _database?.close();
      _database = null;
      print('Database closed');
    } else {
      print('Database is not initialized');
    }
  }

  Future _onCreate(Database db, int version) async {
    print('Creating tables...');
    try {
      await ItemsTable.createTable(db, version);
      // await OwnersTable.createTable(db, version);
      // await LicensesTable.createTable(db, version);
      // await TopicsTable.createTable(db, version);
      print('Tables created successfully');
    } catch (e) {
      print('Error creating tables: $e');
    }
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('Upgrading database from $oldVersion to $newVersion...');
    // Handle database schema migrations here
    print('Database upgraded');
  }
}
