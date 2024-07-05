const itemTable = '''
          CREATE TABLE items(
            id INTEGER PRIMARY KEY,
            node_id TEXT,
            name TEXT,
            full_name TEXT,
            private INTEGER,
            owner TEXT, // store owner information as longtext
            license TEXT, // store license information as longtext
            html_url TEXT,
            description TEXT,
            fork INTEGER,
            url TEXT,
            forks_url TEXT,
            keys_url TEXT,
            collaborators_url TEXT,
            teams_url TEXT,
            hooks_url TEXT,
            issue_events_url TEXT,
            events_url TEXT,
            assignees_url TEXT,
            branches_url TEXT,
            tags_url TEXT,
            blobs_url TEXT,
            git_tags_url TEXT,
            git_refs_url TEXT,
            trees_url TEXT,
            statuses_url TEXT,
            languages_url TEXT,
            stargazers_url TEXT,
            contributors_url TEXT,
            subscribers_url TEXT,
            subscription_url TEXT,
            commits_url TEXT,
            git_commits_url TEXT,
            comments_url TEXT,
            issue_comment_url TEXT,
            contents_url TEXT,
            compare_url TEXT,
            merges_url TEXT,
            archive_url TEXT,
            downloads_url TEXT,
            issues_url TEXT,
            pulls_url TEXT,
            milestones_url TEXT,
            notifications_url TEXT,
            labels_url TEXT,
            releases_url TEXT,
            deployments_url TEXT,
            created_at TEXT,
            updated_at TEXT,
            pushed_at TEXT,
            git_url TEXT,
            ssh_url TEXT,
            clone_url TEXT,
            svn_url TEXT,
            homepage TEXT,
            size INTEGER,
            stargazers_count INTEGER,
            watchers_count INTEGER,
            language TEXT,
            has_issues INTEGER,
            has_projects INTEGER,
            has_downloads INTEGER,
            has_wiki INTEGER,
            has_pages INTEGER,
            has_discussions INTEGER,
            forks_count INTEGER,
            mirror_url TEXT,
            archived INTEGER,
            disabled INTEGER,
            open_issues_count INTEGER,
            allow_forking INTEGER,
            is_template INTEGER,
            web_commit_signoff_required INTEGER,
            topics TEXT,
            visibility TEXT,
            forks INTEGER,
            open_issues INTEGER,
            watchers INTEGER,
            default_branch TEXT,
            score INTEGER
          )
        ''';
