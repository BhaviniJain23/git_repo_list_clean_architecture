import 'package:ailoitte/app/data/data_sources/local/entities/item_table.dart';
import 'package:sqflite/sqflite.dart';

class LicensesTable {
  static const LICENSES_TABLE_NAME = "licenses";
  static const String LICENSES_ID = "id";
  static const String LICENSES_KEY = "key";
  static const String LICENSES_NAME = "name";
  static const String LICENSES_SPDX_ID = "spdx_id";
  static const String LICENSES_URL = "url";
  static const String LICENSES_NODE_ID = "node_id";

  static Future<void> createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $LICENSES_TABLE_NAME (
        $LICENSES_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $LICENSES_KEY TEXT,
        $LICENSES_NAME TEXT,
        $LICENSES_SPDX_ID TEXT,
        $LICENSES_URL TEXT,
        $LICENSES_NODE_ID TEXT
      )
    ''');
  }
}
