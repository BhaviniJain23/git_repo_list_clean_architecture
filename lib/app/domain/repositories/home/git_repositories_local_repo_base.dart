import 'dart:convert';

import 'package:ailoitte/app/data/data_sources/local/entities/item_table.dart';
import 'package:ailoitte/app/data/data_sources/local/entities/license_table.dart';
import 'package:ailoitte/app/data/data_sources/local/entities/owner_table.dart';
import 'package:ailoitte/app/data/data_sources/local/entities/topic_table.dart';
import 'package:ailoitte/app/data/data_sources/local/git_repo_database.dart';
import 'package:ailoitte/app/domain/entities/home/git_repo_response_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class AbstractLocalRepository {
  Future<List<Item>> getRepositories();

  Future<bool> saveRepositories(List<Item> repositories);
  Future<int?> saveOwners(Database db, Owner owner);
  Future<int?> saveLicenses(Database db, License license);
  Future<String?> saveTopics(Database db, List<String> topics, int itemId);
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

  Future<Owner> _getOwnerById(Database db, int ownerId) async {
    final ownerQuery = await db.query(OwnersTable.OWNERS_TABLE_NAME,
        where: 'id =?', whereArgs: [ownerId]);
    return ownerQuery.map((owner) => Owner.fromJson(owner)).first;
  }

  Future<License> _getLicenseById(Database db, int licenseId) async {
    final licenseQuery = await db.query(LicensesTable.LICENSES_TABLE_NAME,
        where: 'id =?', whereArgs: [licenseId]);
    return licenseQuery.map((license) => License.fromJson(license)).first;
  }

  Future<List<String>?> _getTopicsByItemId(Database db, int itemId) async {
    final topicQuery = await db.query(TopicsTable.TOPICS_TABLE_NAME,
        where: 'item_id =?', whereArgs: [itemId]);
    return topicQuery
        .map((topic) => topic['${TopicsTable.TOPICS_TOPIC}'].toString())
        .toList();
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
  Future<int?> saveOwners(Database db, Owner owner) async {
    try {
      // Insert into owners table
      final ownerId = await db.rawInsert('''
      INSERT INTO ${OwnersTable.OWNERS_TABLE_NAME} (${OwnersTable.OWNERS_LOGIN}, ${OwnersTable.OWNERS_ID}, ${OwnersTable.OWNERS_NODE_ID}, ${OwnersTable.OWNERS_AVATAR_URL}, ${OwnersTable.OWNERS_GRAVATAR_ID}, ${OwnersTable.OWNERS_URL}, ${OwnersTable.OWNERS_HTML_URL}, ${OwnersTable.OWNERS_FOLLOWERS_URL}, ${OwnersTable.OWNERS_FOLLOWING_URL}, ${OwnersTable.OWNERS_GISTS_URL}, ${OwnersTable.OWNERS_STARRED_URL}, ${OwnersTable.OWNERS_SUBSCRIPTIONS_URL}, ${OwnersTable.OWNERS_ORGANIZATIONS_URL}, ${OwnersTable.OWNERS_REPOS_URL}, ${OwnersTable.OWNERS_EVENTS_URL}, ${OwnersTable.OWNERS_RECEIVED_EVENTS_URL})
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
      ON CONFLICT (${OwnersTable.OWNERS_ID}) DO UPDATE
      SET ${OwnersTable.OWNERS_LOGIN} = ?, ${OwnersTable.OWNERS_NODE_ID} = ?, ${OwnersTable.OWNERS_AVATAR_URL} = ?, ${OwnersTable.OWNERS_GRAVATAR_ID} = ?, ${OwnersTable.OWNERS_URL} = ?, ${OwnersTable.OWNERS_HTML_URL} = ?, ${OwnersTable.OWNERS_FOLLOWERS_URL} = ?, ${OwnersTable.OWNERS_FOLLOWING_URL} = ?, ${OwnersTable.OWNERS_GISTS_URL} = ?, ${OwnersTable.OWNERS_STARRED_URL} = ?, ${OwnersTable.OWNERS_SUBSCRIPTIONS_URL} = ?, ${OwnersTable.OWNERS_ORGANIZATIONS_URL} = ?, ${OwnersTable.OWNERS_REPOS_URL} = ?, ${OwnersTable.OWNERS_EVENTS_URL} = ?, ${OwnersTable.OWNERS_RECEIVED_EVENTS_URL} = ?
    ''', [
        owner.login,
        owner.id,
        owner.nodeId,
        owner.avatarUrl,
        owner.gravatarId,
        owner.url,
        owner.htmlUrl,
        owner.followersUrl,
        owner.followingUrl,
        owner.gistsUrl,
        owner.starredUrl,
        owner.subscriptionsUrl,
        owner.organizationsUrl,
        owner.reposUrl,
        owner.eventsUrl,
        owner.receivedEventsUrl,
        // Update values
        owner.login,
        owner.nodeId,
        owner.avatarUrl,
        owner.gravatarId,
        owner.url,
        owner.htmlUrl,
        owner.followersUrl,
        owner.followingUrl,
        owner.gistsUrl,
        owner.starredUrl,
        owner.subscriptionsUrl,
        owner.organizationsUrl,
        owner.reposUrl,
        owner.eventsUrl,
        owner.receivedEventsUrl,
      ]);

      return ownerId; // Data saved successfully
    } catch (e) {
      return null; // Data not saved
    }
  }

  @override
  Future<int?> saveLicenses(Database db, License? license) async {
    try {
      // Insert into licenses table
      int? licenseId;
      if (license != null && license.toJson().isNotEmpty) {
        licenseId = await db.rawInsert('''
        INSERT INTO ${LicensesTable.LICENSES_TABLE_NAME} (${LicensesTable.LICENSES_KEY},${LicensesTable.LICENSES_NAME}, ${LicensesTable.LICENSES_NODE_ID}, ${LicensesTable.LICENSES_URL}, ${LicensesTable.LICENSES_SPDX_ID})
        VALUES (?, ?, ?, ?, ?)
      ''', [
          license.key,
          license.name,
          license.nodeId,
          license.url,
          license.spdxId,
        ]);
      }

      return licenseId;
      // Data saved successfully
    } catch (e) {
      return null; // Data not saved
    }
  }

  @override
  Future<String?> saveTopics(
      Database db, List<String> topics, int itemId) async {
    try {
      // Get the last inserted IDs
      List<int> topicIds = [];
      for (var topic in topics) {
        final id = await db.rawInsert('''
        INSERT INTO ${TopicsTable.TOPICS_TABLE_NAME} (${TopicsTable.TOPICS_ITEM_ID}, ${TopicsTable.TOPICS_TOPIC})
        VALUES (?, ?)
      ''', [itemId, topic]);
        topicIds.add(id);
      }
      String topicIdsString = topicIds.join(',');

      return topicIds.isNotEmpty ? topicIdsString : null;
      // Data saved successfully
    } catch (e) {
      return null; // Data not saved
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
