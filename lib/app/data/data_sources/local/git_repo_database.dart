import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:ailoitte/app/data/data_sources/local/entities/item_table.dart';
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
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  @override
  Future<Database> initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(documentsDirectory.path, _databaseName);
    Database db = await openDatabase(dbPath,
        version: _databaseVersion, onCreate: _onCreate, onUpgrade: _onUpgrade);
    await _onCreate(db, _databaseVersion); // Ensure tables are created
    return db;
  }

  @override
  Future<void> closeDatabase() async {
    if (_database != null) {
      await _database?.close();
      _database = null;
    } else {}
  }

  Future _onCreate(Database db, int version) async {
    try {
      await ItemsTable.createTable(db, version);
    } catch (_) {}
  }

  Future _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // Handle database schema migrations here
  }
}
