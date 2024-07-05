import 'package:ailoitte/app/data/data_sources/local/entities/item_table.dart';
import 'package:sqflite/sqflite.dart';

class TopicsTable {
  static const TOPICS_TABLE_NAME = "topics";
  static const String TOPICS_ITEM_ID = "item_id";
  static const String TOPICS_TOPIC = "topic";

  static Future<void> createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $TOPICS_TABLE_NAME (
        $TOPICS_ITEM_ID INTEGER,
        $TOPICS_TOPIC TEXT,
        PRIMARY KEY ($TOPICS_ITEM_ID, $TOPICS_TOPIC),
        FOREIGN KEY ($TOPICS_ITEM_ID) REFERENCES ${ItemsTable.ITEMS_TABLE_NAME}(${ItemsTable.ITEMS_ID})
      )
    ''');
  }
}
