// ignore_for_file: constant_identifier_names

import 'package:sqflite/sqflite.dart';

class ItemsTable {
  static const ITEMS_TABLE_NAME = "git_repos";
  static const String AUTO_ITEMS_ID = "auto_id";
  static const String ITEMS_ID = "id";
  static const String ITEMS_NODE_ID = "node_id";
  static const String ITEMS_NAME = "name";
  static const String ITEMS_FULL_NAME = "full_name";
  static const String ITEMS_PRIVATE = "private";
  static const String ITEMS_OWNER_ID = "owner";
  static const String ITEMS_HTML_URL = "html_url";
  static const String ITEMS_DESCRIPTION = "description";
  static const String ITEMS_FORK = "fork";
  static const String ITEMS_URL = "url";
  static const String ITEMS_FORKS_URL = "forks_url";
  static const String ITEMS_KEYS_URL = "keys_url";
  static const String ITEMS_COLLABORATORS_URL = "collaborators_url";
  static const String ITEMS_TEAMS_URL = "teams_url";
  static const String ITEMS_HOOKS_URL = "hooks_url";
  static const String ITEMS_ISSUE_EVENTS_URL = "issue_events_url";
  static const String ITEMS_EVENTS_URL = "events_url";
  static const String ITEMS_ASSIGNEES_URL = "assignees_url";
  static const String ITEMS_BRANCHES_URL = "branches_url";
  static const String ITEMS_TAGS_URL = "tags_url";
  static const String ITEMS_BLOBS_URL = "blobs_url";
  static const String ITEMS_GIT_TAGS_URL = "git_tags_url";
  static const String ITEMS_GIT_REFS_URL = "git_refs_url";
  static const String ITEMS_TREES_URL = "trees_url";
  static const String ITEMS_STATUSES_URL = "statuses_url";
  static const String ITEMS_LANGUAGES_URL = "languages_url";
  static const String ITEMS_STARGAZERS_URL = "stargazers_url";
  static const String ITEMS_CONTRIBUTORS_URL = "contributors_url";
  static const String ITEMS_SUBSCRIBERS_URL = "subscribers_url";
  static const String ITEMS_SUBSCRIPTION_URL = "subscription_url";
  static const String ITEMS_COMMITS_URL = "commits_url";
  static const String ITEMS_GIT_COMMITS_URL = "git_commits_url";
  static const String ITEMS_COMMENTS_URL = "comments_url";
  static const String ITEMS_ISSUE_COMMENT_URL = "issue_comment_url";
  static const String ITEMS_CONTENTS_URL = "contents_url";
  static const String ITEMS_COMPARE_URL = "compare_url";
  static const String ITEMS_MERGES_URL = "merges_url";
  static const String ITEMS_ARCHIVE_URL = "archive_url";
  static const String ITEMS_DOWNLOADS_URL = "downloads_url";
  static const String ITEMS_ISSUES_URL = "issues_url";
  static const String ITEMS_PULLS_URL = "pulls_url";
  static const String ITEMS_MILESTONES_URL = "milestones_url";
  static const String ITEMS_NOTIFICATIONS_URL = "notifications_url";
  static const String ITEMS_LABELS_URL = "labels_url";
  static const String ITEMS_RELEASES_URL = "releases_url";
  static const String ITEMS_DEPLOYMENTS_URL = "deployments_url";
  static const String ITEMS_CREATED_AT = "created_at";
  static const String ITEMS_UPDATED_AT = "updated_at";
  static const String ITEMS_PUSHED_AT = "pushed_at";
  static const String ITEMS_GIT_URL = "git_url";
  static const String ITEMS_SSH_URL = "ssh_url";
  static const String ITEMS_CLONE_URL = "clone_url";
  static const String ITEMS_SVN_URL = "svn_url";
  static const String ITEMS_HOMEPAGE = "homepage";
  static const String ITEMS_SIZE = "size";
  static const String ITEMS_STARGAZERS_COUNT = "stargazers_count";
  static const String ITEMS_WATCHERS_COUNT = "watchers_count";
  static const String ITEMS_LANGUAGE = "language";
  static const String ITEMS_HAS_ISSUES = "has_issues";
  static const String ITEMS_HAS_PROJECTS = "has_projects";
  static const String ITEMS_HAS_DOWNLOADS = "has_downloads";
  static const String ITEMS_HAS_WIKI = "has_wiki";
  static const String ITEMS_HAS_PAGES = "has_pages";
  static const String ITEMS_HAS_DISCUSSIONS = "has_discussions";
  static const String ITEMS_FORKS_COUNT = "forks_count";
  static const String ITEMS_MIRROR_URL = "mirror_url";
  static const String ITEMS_ARCHIVED = "archived";
  static const String ITEMS_DISABLED = "disabled";
  static const String ITEMS_OPEN_ISSUES_COUNT = "open_issues_count";
  static const String ITEMS_LICENSE_ID = "license";
  static const String ITEMS_ALLOW_FORKING = "allow_forking";
  static const String ITEMS_IS_TEMPLATE = "is_template";
  static const String ITEMS_WEB_COMMIT_SIGNOFF_REQUIRED =
      "web_commit_signoff_required";
  static const String ITEMS_TOPICS = "topics";
  static const String ITEMS_VISIBILITY = "visibility";
  static const String ITEMS_FORKS = "forks";
  static const String ITEMS_OPEN_ISSUES = "open_issues";
  static const String ITEMS_WATCHERS = "watchers";
  static const String ITEMS_DEFAULT_BRANCH = "default_branch";
  static const String ITEMS_SCORE = "score";

  static Future<void> createTable(Database database, int version) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $ITEMS_TABLE_NAME (
        $AUTO_ITEMS_ID INTEGER PRIMARY KEY AUTOINCREMENT,
        $ITEMS_ID INTEGER,
        $ITEMS_NODE_ID TEXT,
        $ITEMS_NAME TEXT,
        $ITEMS_FULL_NAME TEXT,
        $ITEMS_PRIVATE INTEGER,
        $ITEMS_OWNER_ID TEXT DEFAULT NULL, 
        $ITEMS_HTML_URL TEXT,
        $ITEMS_DESCRIPTION TEXT,
        $ITEMS_FORK INTEGER,
        $ITEMS_URL TEXT,
        $ITEMS_FORKS_URL TEXT,
        $ITEMS_KEYS_URL TEXT,
        $ITEMS_COLLABORATORS_URL TEXT,
        $ITEMS_TEAMS_URL TEXT,
        $ITEMS_HOOKS_URL TEXT,
        $ITEMS_ISSUE_EVENTS_URL TEXT,
        $ITEMS_EVENTS_URL TEXT,
        $ITEMS_ASSIGNEES_URL TEXT,
        $ITEMS_BRANCHES_URL TEXT,
        $ITEMS_TAGS_URL TEXT,
        $ITEMS_BLOBS_URL TEXT,
        $ITEMS_GIT_TAGS_URL TEXT,
        $ITEMS_GIT_REFS_URL TEXT,
        $ITEMS_TREES_URL TEXT,
        $ITEMS_STATUSES_URL TEXT,
        $ITEMS_LANGUAGES_URL TEXT,
        $ITEMS_STARGAZERS_URL TEXT,
        $ITEMS_CONTRIBUTORS_URL TEXT,
        $ITEMS_SUBSCRIBERS_URL TEXT,
        $ITEMS_SUBSCRIPTION_URL TEXT,
        $ITEMS_COMMITS_URL TEXT,
        $ITEMS_GIT_COMMITS_URL TEXT,
        $ITEMS_COMMENTS_URL TEXT,
        $ITEMS_ISSUE_COMMENT_URL TEXT,
        $ITEMS_CONTENTS_URL TEXT,
        $ITEMS_COMPARE_URL TEXT,
        $ITEMS_MERGES_URL TEXT,
        $ITEMS_ARCHIVE_URL TEXT,
        $ITEMS_DOWNLOADS_URL TEXT,
        $ITEMS_ISSUES_URL TEXT,
        $ITEMS_PULLS_URL TEXT,
        $ITEMS_MILESTONES_URL TEXT,
        $ITEMS_NOTIFICATIONS_URL TEXT,
        $ITEMS_LABELS_URL TEXT,
        $ITEMS_RELEASES_URL TEXT,
        $ITEMS_DEPLOYMENTS_URL TEXT,
        $ITEMS_CREATED_AT TEXT,
        $ITEMS_UPDATED_AT TEXT,
        $ITEMS_PUSHED_AT TEXT,
        $ITEMS_GIT_URL TEXT,
        $ITEMS_SSH_URL TEXT,
        $ITEMS_CLONE_URL TEXT,
        $ITEMS_SVN_URL TEXT,
        $ITEMS_HOMEPAGE TEXT,
        $ITEMS_SIZE INTEGER,
        $ITEMS_STARGAZERS_COUNT INTEGER,
        $ITEMS_WATCHERS_COUNT INTEGER,
        $ITEMS_LANGUAGE TEXT,
        $ITEMS_HAS_ISSUES INTEGER,
        $ITEMS_HAS_PROJECTS INTEGER,
        $ITEMS_HAS_DOWNLOADS INTEGER,
        $ITEMS_HAS_WIKI INTEGER,
        $ITEMS_HAS_PAGES INTEGER,
        $ITEMS_HAS_DISCUSSIONS INTEGER,
        $ITEMS_FORKS_COUNT INTEGER,
        $ITEMS_MIRROR_URL TEXT,
        $ITEMS_ARCHIVED INTEGER,
        $ITEMS_DISABLED INTEGER,
        $ITEMS_OPEN_ISSUES_COUNT INTEGER,
        $ITEMS_LICENSE_ID TEXT DEFAULT NULL, 
        $ITEMS_ALLOW_FORKING INTEGER,
        $ITEMS_IS_TEMPLATE INTEGER,
        $ITEMS_WEB_COMMIT_SIGNOFF_REQUIRED INTEGER,
        $ITEMS_TOPICS TEXT DEFAULT NULL,
        $ITEMS_VISIBILITY TEXT,
        $ITEMS_FORKS INTEGER,
        $ITEMS_OPEN_ISSUES INTEGER,
        $ITEMS_WATCHERS INTEGER,
        $ITEMS_DEFAULT_BRANCH TEXT,
        $ITEMS_SCORE INTEGER
      )
    ''');
  }
}
