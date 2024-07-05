// ignore_for_file: constant_identifier_names

import 'package:sqflite/sqflite.dart';

class OwnersTable {
  static const OWNERS_TABLE_NAME = "owners";
  static const String OWNERS_ID = "id";
  static const String OWNERS_LOGIN = "login";
  static const String OWNERS_NODE_ID = "node_id";
  static const String OWNERS_AVATAR_URL = "avatar_url";
  static const String OWNERS_GRAVATAR_ID = "gravatar_id";
  static const String OWNERS_URL = "url";
  static const String OWNERS_HTML_URL = "html_url";
  static const String OWNERS_FOLLOWERS_URL = "followers_url";
  static const String OWNERS_FOLLOWING_URL = "following_url";
  static const String OWNERS_GISTS_URL = "gists_url";
  static const String OWNERS_STARRED_URL = "starred_url";
  static const String OWNERS_SUBSCRIPTIONS_URL = "subscriptions_url";
  static const String OWNERS_ORGANIZATIONS_URL = "organizations_url";
  static const String OWNERS_REPOS_URL = "repos_url";
  static const String OWNERS_EVENTS_URL = "events_url";
  static const String OWNERS_RECEIVED_EVENTS_URL = "received_events_url";
  static const String OWNERS_TYPE = "type";
  static const String OWNERS_SITE_ADMIN = "site_admin";

  static Future<void> createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $OWNERS_TABLE_NAME (
        $OWNERS_ID INTEGER PRIMARY KEY,
        $OWNERS_LOGIN TEXT,
        $OWNERS_NODE_ID TEXT,
        $OWNERS_AVATAR_URL TEXT,
        $OWNERS_GRAVATAR_ID TEXT,
        $OWNERS_URL TEXT,
        $OWNERS_HTML_URL TEXT,
        $OWNERS_FOLLOWERS_URL TEXT,
        $OWNERS_FOLLOWING_URL TEXT,
        $OWNERS_GISTS_URL TEXT,
        $OWNERS_STARRED_URL TEXT,
        $OWNERS_SUBSCRIPTIONS_URL TEXT,
        $OWNERS_ORGANIZATIONS_URL TEXT,
        $OWNERS_REPOS_URL TEXT,
        $OWNERS_EVENTS_URL TEXT,
        $OWNERS_RECEIVED_EVENTS_URL TEXT,
        $OWNERS_TYPE TEXT,
        $OWNERS_SITE_ADMIN INTEGER
      )
    ''');
  }
}
