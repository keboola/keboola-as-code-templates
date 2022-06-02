{
  authorization: {
    oauth_api: {},
  },
  parameters: {
    api: {
      baseUrl: "https://api.github.com/",
      retryConfig: {
        http: {
          retryHeader: "X-RetryAfter",
          codes: [
            403,
          ],
        },
        maxRetries: 14,
      },
      authentication: {
        type: "oauth20",
        format: "json",
        headers: {
          Authorization: {
            "function": "concat",
            args: [
              "token ",
              {
                authorization: "data.access_token",
              },
            ],
          },
        },
      },
      pagination: {
        method: "pagenum",
        pageParam: "page",
        limitParam: "per_page",
        limit: 100,
        firstPage: 1,
      },
    },
    config: {
      startDate: Input("ex-github-start-date"),
      incrementalOutput: true,
      jobs: [
        {
          endpoint: "user/orgs",
          dataType: "organizations",
          children: [
            {
              endpoint: "orgs/{1:login}/members",
              dataType: "members",
              placeholders: {
                "1:login": "login",
              },
              children: [
                {
                  endpoint: "users/{1:login}",
                  dataField: ".",
                  dataType: "members_detail",
                  placeholders: {
                    "1:login": "login",
                  },
                },
              ],
            },
            {
              endpoint: "orgs/{1:login}/teams",
              dataType: "teams",
              placeholders: {
                "1:login": "login",
              },
            },
            {
              endpoint: "orgs/{1:login}/repos",
              dataType: "repos",
              placeholders: {
                "1:login": "login",
              },
              children: [
                {
                  endpoint: "repos/{2:login}/{1:name}/commits",
                  recursionFilter: "size>=1",
                  placeholders: {
                    "1:name": "name",
                    "2:login": "login",
                  },
                  dataType: "commits",
                  params: {
                    since: {
                      "function": "date",
                      args: [
                        "Y-m-d",
                        {
                          "function": "strtotime",
                          args: [
                            {
                              attr: "startDate",
                            },
                          ],
                        },
                      ],
                    },
                  },
                },
                {
                  endpoint: "repos/{2:login}/{1:name}/issues",
                  recursionFilter: "size>=1",
                  placeholders: {
                    "1:name": "name",
                    "2:login": "login",
                  },
                  dataType: "issues",
                  params: {
                    since: {
                      "function": "date",
                      args: [
                        "Y-m-d",
                        {
                          "function": "strtotime",
                          args: [
                            {
                              attr: "startDate",
                            },
                          ],
                        },
                      ],
                    },
                  },
                  children: [
                    {
                      endpoint: "repos/{3:login}/{2:name}/issues/{1:issue_number}/comments",
                      placeholders: {
                        "1:issue_number": "number",
                        "2:name": "name",
                        "3:login": "login",
                      },
                      dataType: "issue_comments",
                      params: {
                        since: {
                          "function": "date",
                          args: [
                            "Y-m-d",
                            {
                              "function": "strtotime",
                              args: [
                                {
                                  attr: "startDate",
                                },
                              ],
                            },
                          ],
                        },
                      },
                    },
                  ],
                },
                {
                  endpoint: "repos/{2:login}/{1:name}/pulls",
                  recursionFilter: "size>=1",
                  placeholders: {
                    "1:name": "name",
                    "2:login": "login",
                  },
                  dataType: "pulls",
                  params: {
                    state: "all",
                    since: {
                      "function": "date",
                      args: [
                        "Y-m-d",
                        {
                          "function": "strtotime",
                          args: [
                            {
                              attr: "startDate",
                            },
                          ],
                        },
                      ],
                    },
                  },
                  children: [
                    {
                      endpoint: "repos/{3:login}/{2:name}/pulls/{1:pull_number}/reviews",
                      placeholders: {
                        "1:pull_number": "number",
                        "2:name": "name",
                        "3:login": "login",
                      },
                      dataType: "pull_reviews",
                      params: {
                        since: {
                          "function": "date",
                          args: [
                            "Y-m-d",
                            {
                              "function": "strtotime",
                              args: [
                                {
                                  attr: "startDate",
                                },
                              ],
                            },
                          ],
                        },
                      },
                    },
                    {
                      endpoint: "repos/{3:login}/{2:name}/pulls/{1:pull_number}/comments",
                      placeholders: {
                        "1:pull_number": "number",
                        "2:name": "name",
                        "3:login": "login",
                      },
                      dataType: "pull_comments",
                      params: {
                        since: {
                          "function": "date",
                          args: [
                            "Y-m-d",
                            {
                              "function": "strtotime",
                              args: [
                                {
                                  attr: "startDate",
                                },
                              ],
                            },
                          ],
                        },
                      },
                    },
                    {
                      endpoint: "repos/{3:login}/{2:name}/issues/{1:pull_number}/comments",
                      placeholders: {
                        "1:pull_number": "number",
                        "2:name": "name",
                        "3:login": "login",
                      },
                      dataType: "pull_issue_comments",
                      params: {
                        since: {
                          "function": "date",
                          args: [
                            "Y-m-d",
                            {
                              "function": "strtotime",
                              args: [
                                {
                                  attr: "startDate",
                                },
                              ],
                            },
                          ],
                        },
                      },
                    },
                  ],
                },
              ],
            },
          ],
        },
      ],
      mappings: {
        organizations: {
          login: {
            mapping: {
              destination: "org_name",
              primaryKey: true,
            },
          },
          id: {
            mapping: {
              destination: "org_id",
            },
          },
        },
        pull_reviews: {
          parent_name: {
            type: "user",
            mapping: {
              destination: "repo_name",
            },
          },
          parent_number: {
            type: "user",
            mapping: {
              destination: "pull_number",
            },
          },
          "user.id": {
            mapping: {
              destination: "user_id",
            },
          },
          body: {
            mapping: {
              destination: "body",
            },
          },
          state: {
            mapping: {
              destination: "state",
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          submitted_at: {
            mapping: {
              destination: "submitted_at",
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
        },
        repos: {
          default_branch: {
            mapping: {
              destination: "default_branch",
            },
          },
          size: {
            mapping: {
              destination: "size",
            },
          },
          forks_count: {
            mapping: {
              destination: "forks_count",
            },
          },
          private: {
            mapping: {
              destination: "private",
            },
          },
          has_downloads: {
            mapping: {
              destination: "has_downloads",
            },
          },
          watchers_count: {
            mapping: {
              destination: "watchers_count",
            },
          },
          stargazers_count: {
            mapping: {
              destination: "stargazers_count",
            },
          },
          created_at: {
            mapping: {
              destination: "created_at",
            },
          },
          name: {
            mapping: {
              destination: "name",
            },
          },
          "owner.login": {
            mapping: {
              destination: "owner_login",
            },
          },
          homepage: {
            mapping: {
              destination: "homepage",
            },
          },
          open_issues: {
            mapping: {
              destination: "open_issues",
            },
          },
          forks: {
            mapping: {
              destination: "forks",
            },
          },
          "owner.site_admin": {
            mapping: {
              destination: "owner_site_admin",
            },
          },
          parent_login: {
            type: "user",
            mapping: {
              destination: "org_name",
            },
          },
          "owner.type": {
            mapping: {
              destination: "owner_type",
            },
          },
          has_wiki: {
            mapping: {
              destination: "has_wiki",
            },
          },
          "owner.id": {
            mapping: {
              destination: "owner_id",
            },
          },
          updated_at: {
            mapping: {
              destination: "updated_at",
            },
          },
          watchers: {
            mapping: {
              destination: "watchers",
            },
          },
          language: {
            mapping: {
              destination: "language",
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          full_name: {
            mapping: {
              destination: "full_name",
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          description: {
            mapping: {
              destination: "description",
            },
          },
          has_pages: {
            mapping: {
              destination: "has_pages",
            },
          },
          open_issues_count: {
            mapping: {
              destination: "open_issues_count",
            },
          },
          has_issues: {
            mapping: {
              destination: "has_issues",
            },
          },
        },
        pull_comments: {
          parent_name: {
            type: "user",
            mapping: {
              destination: "repo_name",
            },
          },
          body: {
            mapping: {
              destination: "body",
            },
          },
          created_at: {
            mapping: {
              destination: "created_at",
            },
          },
          updated_at: {
            mapping: {
              destination: "updated_at",
            },
          },
          pull_request_review_id: {
            mapping: {
              destination: "pull_review_id",
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          parent_number: {
            type: "user",
            mapping: {
              destination: "pull_number",
            },
          },
          "user.id": {
            mapping: {
              destination: "user_id",
            },
          },
        },
        pulls: {
          parent_name: {
            type: "user",
            mapping: {
              destination: "repo_name",
            },
          },
          body: {
            mapping: {
              destination: "body",
            },
          },
          merged_at: {
            mapping: {
              destination: "merged_at",
            },
          },
          closed_at: {
            mapping: {
              destination: "closed_at",
            },
          },
          number: {
            mapping: {
              destination: "number",
            },
          },
          created_at: {
            mapping: {
              destination: "created_at",
            },
          },
          merge_commit_sha: {
            mapping: {
              destination: "merge_commit_sha",
            },
          },
          state: {
            mapping: {
              destination: "state",
            },
          },
          updated_at: {
            mapping: {
              destination: "updated_at",
            },
          },
          title: {
            mapping: {
              destination: "title",
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          requested_reviewers: {
            type: "table",
            destination: "pulls_reviewers",
            parentKey: {
              primaryKey: true,
            },
            tableMapping: {
              login: {
                mapping: {
                  destination: "login",
                  primaryKey: false,
                },
              },
              id: {
                mapping: {
                  destination: "id",
                  primaryKey: true,
                },
              },
            },
          },
          "user.id": {
            mapping: {
              destination: "user.id",
            },
          },
        },
        pull_issue_comments: {
          parent_name: {
            type: "user",
            mapping: {
              destination: "repo_name",
            },
          },
          body: {
            mapping: {
              destination: "body",
            },
          },
          created_at: {
            mapping: {
              destination: "created_at",
            },
          },
          author_association: {
            mapping: {
              destination: "author_association",
            },
          },
          url: {
            mapping: {
              destination: "url",
            },
          },
          updated_at: {
            mapping: {
              destination: "updated_at",
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          parent_number: {
            type: "user",
            mapping: {
              destination: "pull_number",
            },
          },
          "user.id": {
            mapping: {
              destination: "user_id",
            },
          },
        },
        teams: {
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          name: {
            mapping: {
              destination: "name",
            },
          },
          parent_login: {
            type: "user",
            mapping: {
              destination: "org_name",
            },
          },
          privacy: {
            mapping: {
              destination: "privacy",
            },
          },
          slug: {
            mapping: {
              destination: "slug",
            },
          },
          permission: {
            mapping: {
              destination: "permission",
            },
          },
          description: {
            mapping: {
              destination: "description",
            },
          },
        },
        members_detail: {
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          login: {
            mapping: {
              destination: "login",
            },
          },
          name: {
            type: "user",
            mapping: {
              destination: "name",
            },
          },
          email: {
            mapping: {
              destination: "email",
            },
          },
          html_url: {
            type: "user",
            mapping: {
              destination: "html_url",
            },
          },
          company: {
            mapping: {
              destination: "company",
            },
          },
          created_at: {
            mapping: {
              destination: "created_at",
            },
          },
        },
        members: {
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          login: {
            mapping: {
              destination: "login",
            },
          },
          parent_login: {
            type: "user",
            mapping: {
              destination: "org_name",
            },
          },
          type: {
            mapping: {
              destination: "type",
            },
          },
          site_admin: {
            mapping: {
              destination: "site_admin",
            },
          },
        },
        issue_comments: {
          parent_name: {
            type: "user",
            mapping: {
              destination: "repo_name",
            },
          },
          body: {
            mapping: {
              destination: "body",
            },
          },
          created_at: {
            mapping: {
              destination: "created_at",
            },
          },
          author_association: {
            mapping: {
              destination: "author_association",
            },
          },
          url: {
            mapping: {
              destination: "url",
            },
          },
          updated_at: {
            mapping: {
              destination: "updated_at",
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          parent_number: {
            type: "user",
            mapping: {
              destination: "issue_number",
            },
          },
          "user.id": {
            mapping: {
              destination: "user_id",
            },
          },
        },
        issues: {
          parent_name: {
            type: "user",
            mapping: {
              destination: "repo_name",
            },
          },
          body: {
            mapping: {
              destination: "body",
            },
          },
          "user.login": {
            mapping: {
              destination: "user.login",
            },
          },
          closed_at: {
            mapping: {
              destination: "closed_at",
            },
          },
          "milestone.number": {
            mapping: {
              destination: "milestone.number",
            },
          },
          number: {
            mapping: {
              destination: "number",
            },
          },
          created_at: {
            mapping: {
              destination: "created_at",
            },
          },
          "assignee.login": {
            mapping: {
              destination: "assignee.login",
            },
          },
          locked: {
            mapping: {
              destination: "locked",
            },
          },
          state: {
            mapping: {
              destination: "state",
            },
          },
          comments: {
            mapping: {
              destination: "comments",
            },
          },
          parent_login: {
            type: "user",
            mapping: {
              destination: "repo_organization",
            },
          },
          updated_at: {
            mapping: {
              destination: "updated_at",
            },
          },
          title: {
            mapping: {
              destination: "title",
            },
          },
          "milestone.id": {
            mapping: {
              destination: "milestone.id",
            },
          },
          "milestone.title": {
            mapping: {
              destination: "milestone.title",
            },
          },
          "assignee.id": {
            mapping: {
              destination: "assignee.id",
            },
          },
          "user.site_admin": {
            mapping: {
              destination: "user.site_admin",
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          "milestone.creator.id": {
            mapping: {
              destination: "milestone.creator.id",
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          "user.type": {
            mapping: {
              destination: "user.type",
            },
          },
          "user.id": {
            mapping: {
              destination: "user.id",
            },
          },
          labels: {
            type: "table",
            destination: "issue_labels",
            parentKey: {
              primaryKey: true,
            },
            tableMapping: {
              name: {
                mapping: {
                  destination: "name",
                  primaryKey: true,
                },
              },
              color: {
                mapping: {
                  destination: "color",
                  primaryKey: true,
                },
              },
            },
          },
        },
        commits: {
          parent_name: {
            type: "user",
            mapping: {
              destination: "repo_name",
            },
          },
          "author.login": {
            mapping: {
              destination: "author.login",
            },
          },
          sha: {
            mapping: {
              destination: "sha",
              primaryKey: true,
              propertyOrder: 1,
            },
          },
          "commit.author.email": {
            mapping: {
              destination: "commit.author.email",
            },
          },
          "commit.message": {
            mapping: {
              destination: "commit.message",
            },
          },
          parent_login: {
            type: "user",
            mapping: {
              destination: "repo_organization",
            },
          },
          "commit.author.name": {
            mapping: {
              destination: "commit.author.name",
            },
          },
          "commit.author.date": {
            mapping: {
              destination: "commit.author.date",
            },
          },
          html_url: {
            mapping: {
              destination: "html_url",
            },
          },
          "author.id": {
            mapping: {
              destination: "author.id",
            },
          },
        },
      },
    },
  },
}
