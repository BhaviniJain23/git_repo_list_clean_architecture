import 'package:ailoitte/app/data/data_sources/local/entities/item_table.dart';
import 'package:ailoitte/app/data/data_sources/local/git_repo_database.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class AbstractLocalRepository {
  Future<List<Item>> getRepositories();

  Future<bool> saveRepositories(List<Item> repositories);
  Future<void> deleteRepositories();
  Future<bool> isRepositoryExist();
}

class GitRepoLocalRepo implements AbstractLocalRepository {
  final SqliteDatabaseHelper _databaseHelper;

  GitRepoLocalRepo(this._databaseHelper);

// Binding owners, licenses, and topics to Item
  @override
  Future<List<Item>> getRepositories() async {
    final db = await _databaseHelper.database;
    final tableExists = await _tableExists(db, ItemsTable.ITEMS_TABLE_NAME);
    if (!tableExists) {
      return [];
    }
    final repos = await db.query(ItemsTable.ITEMS_TABLE_NAME);
    final items = <Item>[];
    for (var repo in repos) {
      items.add(Item.fromItemSQLite(repo));
    }
    return items;
  }

  @override
  Future<bool> saveRepositories(List<Item> repositories) async {
    final db = await _databaseHelper.database;

    try {
      // Create tables if they don't exist
      await ItemsTable.createTable(db, 1);

      // Delete existing data
      await db.delete(ItemsTable.ITEMS_TABLE_NAME);

      final batch = db.batch();
      for (var repo in repositories) {
        batch.insert(ItemsTable.ITEMS_TABLE_NAME, repo.insertIntoSQLite());
      }
      await batch.commit();
      return true; // Data saved successfully
    } catch (e) {
      return false; // Data not saved
    }
  }

  @override
  Future<void> deleteRepositories() async {
    final db = await _databaseHelper.database;
    await db.delete(ItemsTable.ITEMS_TABLE_NAME);
  }

  @override
  Future<bool> isRepositoryExist() async {
    final db = await _databaseHelper.database;
    final count = Sqflite.firstIntValue(
        await db.query(ItemsTable.ITEMS_TABLE_NAME, columns: ['COUNT(*)']));
    return count! > 0;
  }

  Future<bool> _tableExists(Database db, String tableName) async {
    final result = await db.query('sqlite_master',
        where: 'type = ? AND name = ?', whereArgs: ['table', tableName]);
    return result.isNotEmpty;
  }
}
