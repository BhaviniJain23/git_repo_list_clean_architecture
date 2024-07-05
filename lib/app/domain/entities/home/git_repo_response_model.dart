import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'git_repo_response_model.g.dart';

GitRepoResponseModel gitRepoResponseModelFromJson(String str) =>
    GitRepoResponseModel.fromJson(json.decode(str));

String gitRepoResponseModelToJson(GitRepoResponseModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GitRepoResponseModel {
  @JsonKey(name: "total_count")
  final int totalCount;
  @JsonKey(name: "incomplete_results")
  final bool incompleteResults;
  @JsonKey(name: "items")
  final List<Item> items;

  GitRepoResponseModel({
    required this.totalCount,
    required this.incompleteResults,
    required this.items,
  });

  GitRepoResponseModel copyWith({
    int? totalCount,
    bool? incompleteResults,
    List<Item>? items,
  }) =>
      GitRepoResponseModel(
        totalCount: totalCount ?? this.totalCount,
        incompleteResults: incompleteResults ?? this.incompleteResults,
        items: items ?? this.items,
      );

  factory GitRepoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GitRepoResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GitRepoResponseModelToJson(this);
}

@JsonSerializable()
class Item {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "full_name")
  final String fullName;
  @JsonKey(name: "private")
  final bool private;

  @JsonKey(name: "owner")
  final Owner owner;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "fork")
  final bool fork;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "forks_url")
  final String forksUrl;
  @JsonKey(name: "keys_url")
  final String keysUrl;
  @JsonKey(name: "collaborators_url")
  final String collaboratorsUrl;
  @JsonKey(name: "teams_url")
  final String teamsUrl;
  @JsonKey(name: "hooks_url")
  final String hooksUrl;
  @JsonKey(name: "issue_events_url")
  final String issueEventsUrl;
  @JsonKey(name: "events_url")
  final String eventsUrl;
  @JsonKey(name: "assignees_url")
  final String assigneesUrl;
  @JsonKey(name: "branches_url")
  final String branchesUrl;
  @JsonKey(name: "tags_url")
  final String tagsUrl;
  @JsonKey(name: "blobs_url")
  final String blobsUrl;
  @JsonKey(name: "git_tags_url")
  final String gitTagsUrl;
  @JsonKey(name: "git_refs_url")
  final String gitRefsUrl;
  @JsonKey(name: "trees_url")
  final String treesUrl;
  @JsonKey(name: "statuses_url")
  final String statusesUrl;
  @JsonKey(name: "languages_url")
  final String languagesUrl;
  @JsonKey(name: "stargazers_url")
  final String stargazersUrl;
  @JsonKey(name: "contributors_url")
  final String contributorsUrl;
  @JsonKey(name: "subscribers_url")
  final String subscribersUrl;
  @JsonKey(name: "subscription_url")
  final String subscriptionUrl;
  @JsonKey(name: "commits_url")
  final String commitsUrl;
  @JsonKey(name: "git_commits_url")
  final String gitCommitsUrl;
  @JsonKey(name: "comments_url")
  final String commentsUrl;
  @JsonKey(name: "issue_comment_url")
  final String issueCommentUrl;
  @JsonKey(name: "contents_url")
  final String contentsUrl;
  @JsonKey(name: "compare_url")
  final String compareUrl;
  @JsonKey(name: "merges_url")
  final String mergesUrl;
  @JsonKey(name: "archive_url")
  final String archiveUrl;
  @JsonKey(name: "downloads_url")
  final String downloadsUrl;
  @JsonKey(name: "issues_url")
  final String issuesUrl;
  @JsonKey(name: "pulls_url")
  final String pullsUrl;
  @JsonKey(name: "milestones_url")
  final String milestonesUrl;
  @JsonKey(name: "notifications_url")
  final String notificationsUrl;
  @JsonKey(name: "labels_url")
  final String labelsUrl;
  @JsonKey(name: "releases_url")
  final String releasesUrl;
  @JsonKey(name: "deployments_url")
  final String deploymentsUrl;
  @JsonKey(name: "created_at")
  final DateTime createdAt;
  @JsonKey(name: "updated_at")
  final DateTime updatedAt;
  @JsonKey(name: "pushed_at")
  final DateTime pushedAt;
  @JsonKey(name: "git_url")
  final String gitUrl;
  @JsonKey(name: "ssh_url")
  final String sshUrl;
  @JsonKey(name: "clone_url")
  final String cloneUrl;
  @JsonKey(name: "svn_url")
  final String svnUrl;
  @JsonKey(name: "homepage")
  final String? homepage;
  @JsonKey(name: "size")
  final int size;
  @JsonKey(name: "stargazers_count")
  final int stargazersCount;
  @JsonKey(name: "watchers_count")
  final int watchersCount;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "has_issues")
  final bool hasIssues;
  @JsonKey(name: "has_projects")
  final bool hasProjects;
  @JsonKey(name: "has_downloads")
  final bool hasDownloads;
  @JsonKey(name: "has_wiki")
  final bool hasWiki;
  @JsonKey(name: "has_pages")
  final bool hasPages;
  @JsonKey(name: "has_discussions")
  final bool hasDiscussions;
  @JsonKey(name: "forks_count")
  final int forksCount;
  @JsonKey(name: "mirror_url")
  final dynamic mirrorUrl;
  @JsonKey(name: "archived")
  final bool archived;
  @JsonKey(name: "disabled")
  final bool disabled;
  @JsonKey(name: "open_issues_count")
  final int openIssuesCount;
  @JsonKey(name: "license")
  final License? license;
  @JsonKey(name: "allow_forking")
  final bool allowForking;
  @JsonKey(name: "is_template")
  final bool isTemplate;
  @JsonKey(name: "web_commit_signoff_required")
  final bool webCommitSignoffRequired;
  @JsonKey(name: "topics")
  final List<String> topics;
  @JsonKey(name: "visibility")
  final String visibility;
  @JsonKey(name: "forks")
  final int forks;
  @JsonKey(name: "open_issues")
  final int openIssues;
  @JsonKey(name: "watchers")
  final int watchers;
  @JsonKey(name: "default_branch")
  final String defaultBranch;
  @JsonKey(name: "score")
  final int score;

  Item({
    required this.id,
    required this.nodeId,
    required this.name,
    required this.fullName,
    required this.private,
    required this.owner,
    required this.htmlUrl,
    required this.description,
    required this.fork,
    required this.url,
    required this.forksUrl,
    required this.keysUrl,
    required this.collaboratorsUrl,
    required this.teamsUrl,
    required this.hooksUrl,
    required this.issueEventsUrl,
    required this.eventsUrl,
    required this.assigneesUrl,
    required this.branchesUrl,
    required this.tagsUrl,
    required this.blobsUrl,
    required this.gitTagsUrl,
    required this.gitRefsUrl,
    required this.treesUrl,
    required this.statusesUrl,
    required this.languagesUrl,
    required this.stargazersUrl,
    required this.contributorsUrl,
    required this.subscribersUrl,
    required this.subscriptionUrl,
    required this.commitsUrl,
    required this.gitCommitsUrl,
    required this.commentsUrl,
    required this.issueCommentUrl,
    required this.contentsUrl,
    required this.compareUrl,
    required this.mergesUrl,
    required this.archiveUrl,
    required this.downloadsUrl,
    required this.issuesUrl,
    required this.pullsUrl,
    required this.milestonesUrl,
    required this.notificationsUrl,
    required this.labelsUrl,
    required this.releasesUrl,
    required this.deploymentsUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.pushedAt,
    required this.gitUrl,
    required this.sshUrl,
    required this.cloneUrl,
    required this.svnUrl,
    required this.homepage,
    required this.size,
    required this.stargazersCount,
    required this.watchersCount,
    required this.language,
    required this.hasIssues,
    required this.hasProjects,
    required this.hasDownloads,
    required this.hasWiki,
    required this.hasPages,
    required this.hasDiscussions,
    required this.forksCount,
    required this.mirrorUrl,
    required this.archived,
    required this.disabled,
    required this.openIssuesCount,
    required this.license,
    required this.allowForking,
    required this.isTemplate,
    required this.webCommitSignoffRequired,
    required this.topics,
    required this.visibility,
    required this.forks,
    required this.openIssues,
    required this.watchers,
    required this.defaultBranch,
    required this.score,
  });

  Item copyWith({
    int? id,
    String? nodeId,
    String? name,
    String? fullName,
    bool? private,
    Owner? owner,
    String? htmlUrl,
    String? description,
    bool? fork,
    String? url,
    String? forksUrl,
    String? keysUrl,
    String? collaboratorsUrl,
    String? teamsUrl,
    String? hooksUrl,
    String? issueEventsUrl,
    String? eventsUrl,
    String? assigneesUrl,
    String? branchesUrl,
    String? tagsUrl,
    String? blobsUrl,
    String? gitTagsUrl,
    String? gitRefsUrl,
    String? treesUrl,
    String? statusesUrl,
    String? languagesUrl,
    String? stargazersUrl,
    String? contributorsUrl,
    String? subscribersUrl,
    String? subscriptionUrl,
    String? commitsUrl,
    String? gitCommitsUrl,
    String? commentsUrl,
    String? issueCommentUrl,
    String? contentsUrl,
    String? compareUrl,
    String? mergesUrl,
    String? archiveUrl,
    String? downloadsUrl,
    String? issuesUrl,
    String? pullsUrl,
    String? milestonesUrl,
    String? notificationsUrl,
    String? labelsUrl,
    String? releasesUrl,
    String? deploymentsUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? pushedAt,
    String? gitUrl,
    String? sshUrl,
    String? cloneUrl,
    String? svnUrl,
    String? homepage,
    int? size,
    int? stargazersCount,
    int? watchersCount,
    String? language,
    bool? hasIssues,
    bool? hasProjects,
    bool? hasDownloads,
    bool? hasWiki,
    bool? hasPages,
    bool? hasDiscussions,
    int? forksCount,
    dynamic mirrorUrl,
    bool? archived,
    bool? disabled,
    int? openIssuesCount,
    License? license,
    bool? allowForking,
    bool? isTemplate,
    bool? webCommitSignoffRequired,
    List<String>? topics,
    String? visibility,
    int? forks,
    int? openIssues,
    int? watchers,
    String? defaultBranch,
    int? score,
  }) =>
      Item(
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        name: name ?? this.name,
        fullName: fullName ?? this.fullName,
        private: private ?? this.private,
        owner: owner ?? this.owner,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        description: description ?? this.description,
        fork: fork ?? this.fork,
        url: url ?? this.url,
        forksUrl: forksUrl ?? this.forksUrl,
        keysUrl: keysUrl ?? this.keysUrl,
        collaboratorsUrl: collaboratorsUrl ?? this.collaboratorsUrl,
        teamsUrl: teamsUrl ?? this.teamsUrl,
        hooksUrl: hooksUrl ?? this.hooksUrl,
        issueEventsUrl: issueEventsUrl ?? this.issueEventsUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        assigneesUrl: assigneesUrl ?? this.assigneesUrl,
        branchesUrl: branchesUrl ?? this.branchesUrl,
        tagsUrl: tagsUrl ?? this.tagsUrl,
        blobsUrl: blobsUrl ?? this.blobsUrl,
        gitTagsUrl: gitTagsUrl ?? this.gitTagsUrl,
        gitRefsUrl: gitRefsUrl ?? this.gitRefsUrl,
        treesUrl: treesUrl ?? this.treesUrl,
        statusesUrl: statusesUrl ?? this.statusesUrl,
        languagesUrl: languagesUrl ?? this.languagesUrl,
        stargazersUrl: stargazersUrl ?? this.stargazersUrl,
        contributorsUrl: contributorsUrl ?? this.contributorsUrl,
        subscribersUrl: subscribersUrl ?? this.subscribersUrl,
        subscriptionUrl: subscriptionUrl ?? this.subscriptionUrl,
        commitsUrl: commitsUrl ?? this.commitsUrl,
        gitCommitsUrl: gitCommitsUrl ?? this.gitCommitsUrl,
        commentsUrl: commentsUrl ?? this.commentsUrl,
        issueCommentUrl: issueCommentUrl ?? this.issueCommentUrl,
        contentsUrl: contentsUrl ?? this.contentsUrl,
        compareUrl: compareUrl ?? this.compareUrl,
        mergesUrl: mergesUrl ?? this.mergesUrl,
        archiveUrl: archiveUrl ?? this.archiveUrl,
        downloadsUrl: downloadsUrl ?? this.downloadsUrl,
        issuesUrl: issuesUrl ?? this.issuesUrl,
        pullsUrl: pullsUrl ?? this.pullsUrl,
        milestonesUrl: milestonesUrl ?? this.milestonesUrl,
        notificationsUrl: notificationsUrl ?? this.notificationsUrl,
        labelsUrl: labelsUrl ?? this.labelsUrl,
        releasesUrl: releasesUrl ?? this.releasesUrl,
        deploymentsUrl: deploymentsUrl ?? this.deploymentsUrl,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pushedAt: pushedAt ?? this.pushedAt,
        gitUrl: gitUrl ?? this.gitUrl,
        sshUrl: sshUrl ?? this.sshUrl,
        cloneUrl: cloneUrl ?? this.cloneUrl,
        svnUrl: svnUrl ?? this.svnUrl,
        homepage: homepage ?? this.homepage,
        size: size ?? this.size,
        stargazersCount: stargazersCount ?? this.stargazersCount,
        watchersCount: watchersCount ?? this.watchersCount,
        language: language ?? this.language,
        hasIssues: hasIssues ?? this.hasIssues,
        hasProjects: hasProjects ?? this.hasProjects,
        hasDownloads: hasDownloads ?? this.hasDownloads,
        hasWiki: hasWiki ?? this.hasWiki,
        hasPages: hasPages ?? this.hasPages,
        hasDiscussions: hasDiscussions ?? this.hasDiscussions,
        forksCount: forksCount ?? this.forksCount,
        mirrorUrl: mirrorUrl ?? this.mirrorUrl,
        archived: archived ?? this.archived,
        disabled: disabled ?? this.disabled,
        openIssuesCount: openIssuesCount ?? this.openIssuesCount,
        license: license ?? this.license,
        allowForking: allowForking ?? this.allowForking,
        isTemplate: isTemplate ?? this.isTemplate,
        webCommitSignoffRequired:
            webCommitSignoffRequired ?? this.webCommitSignoffRequired,
        topics: topics ?? this.topics,
        visibility: visibility ?? this.visibility,
        forks: forks ?? this.forks,
        openIssues: openIssues ?? this.openIssues,
        watchers: watchers ?? this.watchers,
        defaultBranch: defaultBranch ?? this.defaultBranch,
        score: score ?? this.score,
      );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  Map<String, dynamic> insertIntoSQLite() {
    final json = toJson();
    final values = <String, dynamic>{};
    values.addAll(json);
    values['private'] = json['private'] ? 1 : 0;
    values['fork'] = json['fork'] ? 1 : 0;
    values['has_issues'] = json['has_issues'] ? 1 : 0;
    values['has_projects'] = json['has_projects'] ? 1 : 0;
    values['has_downloads'] = json['has_downloads'] ? 1 : 0;
    values['has_wiki'] = json['has_wiki'] ? 1 : 0;
    values['has_pages'] = json['has_pages'] ? 1 : 0;
    values['has_discussions'] = json['has_discussions'] ? 1 : 0;
    values['archived'] = json['archived'] ? 1 : 0;
    values['disabled'] = json['disabled'] ? 1 : 0;
    values['open_issues_count'] = json['open_issues_count'];
    values['license'] = jsonEncode(json['license']);
    values['allow_forking'] = json['allow_forking'] ? 1 : 0;
    values['is_template'] = json['is_template'] ? 1 : 0;
    values['web_commit_signoff_required'] =
        json['web_commit_signoff_required'] ? 1 : 0;
    values['topics'] = json['topics'].join(' , ');
    values['license'] = jsonEncode(json['license']);
    values['owner'] = jsonEncode(owner.toConvertForSQLite());
    return values;
  }

  static Item fromItemSQLite(Map<String, dynamic> values) {
    final jsonObject = <String, dynamic>{};
    jsonObject.addAll(values);
    jsonObject['private'] = values['private'] == 1;
    jsonObject['fork'] = values['fork'] == 1;
    jsonObject['has_issues'] = values['has_issues'] == 1;
    jsonObject['has_projects'] = values['has_projects'] == 1;
    jsonObject['has_downloads'] = values['has_downloads'] == 1;
    jsonObject['has_wiki'] = values['has_wiki'] == 1;
    jsonObject['has_pages'] = values['has_pages'] == 1;
    jsonObject['has_discussions'] = values['has_discussions'] == 1;
    jsonObject['archived'] = values['archived'] == 1;
    jsonObject['disabled'] = values['disabled'] == 1;
    jsonObject['open_issues_count'] = values['open_issues_count'];
    jsonObject['license'] = jsonEncode(jsonObject['license']);
    jsonObject['allow_forking'] = values['allow_forking'] == 1;
    jsonObject['is_template'] = values['is_template'] == 1;
    jsonObject['web_commit_signoff_required'] =
        jsonObject['web_commit_signoff_required'] == 1;
    jsonObject['topics'] = values['topics'].toString().split(' , ');
    jsonObject['license'] = jsonDecode(values['license']);
    jsonObject['owner'] = Owner.fromOwnerSQLite(jsonDecode(values['owner']));
    return Item.fromJson(jsonObject);
  }
}

@JsonSerializable()
class License {
  @JsonKey(name: "key")
  final String key;
  @JsonKey(name: "name")
  final String name;
  @JsonKey(name: "spdx_id")
  final String spdxId;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "node_id")
  final String nodeId;

  License({
    required this.key,
    required this.name,
    required this.spdxId,
    required this.url,
    required this.nodeId,
  });

  License copyWith({
    String? key,
    String? name,
    String? spdxId,
    String? url,
    String? nodeId,
  }) =>
      License(
        key: key ?? this.key,
        name: name ?? this.name,
        spdxId: spdxId ?? this.spdxId,
        url: url ?? this.url,
        nodeId: nodeId ?? this.nodeId,
      );

  factory License.fromJson(Map<String, dynamic> json) =>
      _$LicenseFromJson(json);

  Map<String, dynamic> toJson() => _$LicenseToJson(this);
}

@JsonSerializable()
class Owner {
  @JsonKey(name: "login")
  final String login;
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "node_id")
  final String nodeId;
  @JsonKey(name: "avatar_url")
  final String avatarUrl;
  @JsonKey(name: "gravatar_id")
  final String gravatarId;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "html_url")
  final String htmlUrl;
  @JsonKey(name: "followers_url")
  final String followersUrl;
  @JsonKey(name: "following_url")
  final String followingUrl;
  @JsonKey(name: "gists_url")
  final String gistsUrl;
  @JsonKey(name: "starred_url")
  final String starredUrl;
  @JsonKey(name: "subscriptions_url")
  final String subscriptionsUrl;
  @JsonKey(name: "organizations_url")
  final String organizationsUrl;
  @JsonKey(name: "repos_url")
  final String reposUrl;
  @JsonKey(name: "events_url")
  final String eventsUrl;
  @JsonKey(name: "received_events_url")
  final String receivedEventsUrl;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "site_admin")
  final bool siteAdmin;

  Owner({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
  });

  Owner copyWith({
    String? login,
    int? id,
    String? nodeId,
    String? avatarUrl,
    String? gravatarId,
    String? url,
    String? htmlUrl,
    String? followersUrl,
    String? followingUrl,
    String? gistsUrl,
    String? starredUrl,
    String? subscriptionsUrl,
    String? organizationsUrl,
    String? reposUrl,
    String? eventsUrl,
    String? receivedEventsUrl,
    String? type,
    bool? siteAdmin,
  }) =>
      Owner(
        login: login ?? this.login,
        id: id ?? this.id,
        nodeId: nodeId ?? this.nodeId,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        gravatarId: gravatarId ?? this.gravatarId,
        url: url ?? this.url,
        htmlUrl: htmlUrl ?? this.htmlUrl,
        followersUrl: followersUrl ?? this.followersUrl,
        followingUrl: followingUrl ?? this.followingUrl,
        gistsUrl: gistsUrl ?? this.gistsUrl,
        starredUrl: starredUrl ?? this.starredUrl,
        subscriptionsUrl: subscriptionsUrl ?? this.subscriptionsUrl,
        organizationsUrl: organizationsUrl ?? this.organizationsUrl,
        reposUrl: reposUrl ?? this.reposUrl,
        eventsUrl: eventsUrl ?? this.eventsUrl,
        receivedEventsUrl: receivedEventsUrl ?? this.receivedEventsUrl,
        type: type ?? this.type,
        siteAdmin: siteAdmin ?? this.siteAdmin,
      );

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  Map<String, dynamic> toConvertForSQLite() {
    final json = toJson();
    final values = <String, dynamic>{};
    values.addAll(json);
    values['site_admin'] = json['site_admin'] ? 1 : 0;
    values['type'] = json['type'].toString();
    return values;
  }

  static Map<String, dynamic> fromOwnerSQLite(Map<String, dynamic> json) {
    final values = <String, dynamic>{};
    values.addAll(json);
    values['site_admin'] = json['site_admin'] == 1;
    values['type'] = json['type'].toString();
    return values;
  }
}
