--create output repository table
--change flags to true/false
--format date
--mark Looker repositories based on changed files
CREATE TABLE "out_repository"
AS
    SELECT
        "r"."id"                                            AS "repository_id",
        "r"."name"                                          AS "repository",
        ''                                                  AS "project",
        iff(length("r"."description") > 1024, left("r"."description", 1021) || '...',
            "r"."description")                              AS "description",
        iff("r"."language" = '', 'unknown', "r"."language") AS "language",
        iff("r"."has_wiki" = '1', 'true', 'false')          AS "has_wiki",
        iff("r"."has_issues" = '1', 'true', 'false')        AS "has_issues",
        iff("r"."private" = '1', 'true', 'false')           AS "is_private",
        replace(left("r"."created_at", 19), 'T', ' ')       AS "created_on",
        "r"."html_url"                                      AS "url"
    FROM "repos" "r";

--format dates
--referential integrity check
--define if closed pull request is declined or merged
CREATE TABLE "out_pull_request"
AS
    SELECT
        "p"."id"                                      AS "pull_request_id",
        "r"."repository_id",
        ifnull("u"."user_id", '0')                    AS "user_id",
        "p"."title",
        iff(length("p"."body") > 1024, left("p"."body", 1021) || '...',
            "p"."body")                               AS "description",
        (CASE
             WHEN "p"."state" = 'closed' AND "p"."merged_at" = ''
                 THEN 'declined'
             WHEN "p"."state" = 'closed' AND "p"."merged_at" <> ''
                 THEN 'merged'
             ELSE "p"."state"
         END)                                         AS "state",
        replace(left("p"."created_at", 19), 'T', ' ') AS "created_on",
        replace(left("p"."updated_at", 19), 'T', ' ') AS "updated_on",
        "p"."html_url"                                AS "url"
    FROM "pulls" "p"
             INNER JOIN "out_repository" "r"
                        ON "p"."repo_name" = "r"."repository"
             LEFT JOIN "user" "u"
                       ON "p"."user_id" = "u"."user_id";

--easy deduplication of activity (there is no state which can change during time)
--format columns
CREATE TABLE "out_pull_request_activity"
AS
    SELECT DISTINCT
            "opr"."repository_id" || '_' || "opr"."pull_request_id" || '_' || "pr"."state" || '_' ||
            left("pr"."submitted_at", 19)                                             AS "pull_request_activity_id",
            "opr"."pull_request_id",
            ifnull("u"."user_id", '0')                                                AS "user_id",
            ifnull("u"."user", 'External User')                                       AS "user",
            replace(left("pr"."submitted_at", 19), 'T', ' ')                          AS "date",
            "pr"."state",
            left(coalesce("pc"."body", "pr"."body"), 255)                             AS "title",
            iff(length(coalesce("pc"."body", "pr"."body")) > 1024,
                left(coalesce("pc"."body", "pr"."body"), 1021) || '...', "pr"."body") AS "description",
            '' :: VARCHAR(1024)                                                       AS "reason"
    FROM "pull_reviews" "pr"
             INNER JOIN "out_pull_request" "opr"
                        ON split_part("pr"."html_url", '#', 1) = "opr"."url"
             LEFT JOIN "user" "u"
                       ON "pr"."user_id" = "u"."user_id"
             LEFT JOIN "pull_comments" "pc"
                       ON "pr"."id" = "pc"."pull_review_id"
    WHERE "pr"."state" <> '';

--insert comments on pull request (those are gathered from issues endpoint)
--check if the timestamp is same as closing the request (GitHub action "comment and close") and mark such activity as 'DECLINED'
--format dates
INSERT INTO "out_pull_request_activity"
    ("pull_request_activity_id", "pull_request_id", "user_id", "user", "date", "state", "title", "description",
     "reason")
SELECT
        "opr"."repository_id" || '_' || "opr"."pull_request_id" || '_COMMENTED_' ||
        left("pic"."created_at", 19)                    AS "pull_request_activity_id",
        "opr"."pull_request_id",
        ifnull("u"."user_id", '0')                      AS "user_id",
        ifnull("u"."user", 'External User')             AS "user",
        replace(left("pic"."created_at", 19), 'T', ' ') AS "date",
        iff("p"."id" IS NULL, 'COMMENTED', 'DECLINED')  AS "state",
        left("pic"."body", 255)                         AS "title",
        iff(length("pic"."body") > 1024, left("pic"."body", 1021) || '...',
            "pic"."body")                               AS "description",
        iff("p"."id" IS NULL, '', iff(length("pic"."body") > 1024, left("pic"."body", 1021) || '...',
                                      "pic"."body"))    AS "reason"
FROM "pull_issue_comments" "pic"
         INNER JOIN "out_pull_request" "opr"
                    ON split_part("pic"."html_url", '#', 1) = "opr"."url"
         LEFT JOIN "user" "u"
                   ON "pic"."user_id" = "u"."user_id"
         LEFT JOIN "pulls" "p"
                   ON "opr"."pull_request_id" = "p"."id"
                       AND "pic"."created_at" = "p"."closed_at";

--add merge activity
INSERT INTO "out_pull_request_activity"
    ("pull_request_activity_id", "pull_request_id", "user_id", "user", "date", "state", "title", "description",
     "reason")
SELECT
        "r"."repository_id" || '_' || "p"."id" || '_MERGED_' ||
        left("p"."merged_at", 19)                    AS "pull_request_activity_id",
        "p"."id"                                     AS "pull_request_id",
        ifnull("u"."user_id", '0')                   AS "user_id",
        ifnull("u"."user", 'External User')          AS "user",
        replace(left("p"."merged_at", 19), 'T', ' ') AS "date",
        'MERGED'                                     AS "state",
        "p"."title",
        iff(length("p"."body") > 1024, left("p"."body", 1021) || '...',
            "p"."body")                              AS "description",
        ''                                           AS "reason"
FROM "pulls" "p"
         INNER JOIN "out_repository" "r"
                    ON "p"."repo_name" = "r"."repository"
         LEFT JOIN "user" "u"
                   ON "p"."user_id" = "u"."user_id"
WHERE "p"."merged_at" <> '';

--create output commits table
CREATE TABLE "out_repository_commit"
AS
    SELECT
        "c"."sha"                                             AS "repository_commit_id",
        "or"."repository_id",
        ifnull("u"."user_id", '0')                            AS "user_id",
        replace(left("c"."commit_author_date", 19), 'T', ' ') AS "date",
        "c"."html_url"                                        AS "url",
        iff(length("c"."commit_message") > 1024, left("c"."commit_message", 1021) || '...',
            "c"."commit_message")                             AS "message"
    FROM "commits" "c"
             INNER JOIN "out_repository" "or"
                        ON "c"."repo_name" = "or"."repository"
             LEFT JOIN "user" "u"
                       ON "c"."author_id" = "u"."user_id";

--create output issues table
CREATE TABLE "out_issue"
AS
    SELECT
        "i"."id"                                                                    AS "issue_id",
        "r"."repository_id"                                                         AS "repository_id",
        ifnull("u"."user_id", '0')                                                  AS "user_id",
        "i"."user_login"                                                            AS "reporter",
        "i"."id"                                                                    AS "number",
        "i"."title",
        IFF(LENGTH("i"."body") > 1024, LEFT("i"."body", 1021) || '...', "i"."body") AS "description",
        "i"."state",
        ''                                                                          AS "priority",
        ''                                                                          AS "kind",
        replace(left("i"."created_at", 19), 'T', ' ')                               AS "created_on",
        replace(left("i"."updated_at", 19), 'T', ' ')                               AS "updated_on",
        "i"."html_url"                                                              AS "url"
    FROM "issues" "i"
             INNER JOIN "out_repository" "r"
                        ON "i"."repo_name" = "r"."repository"
             LEFT JOIN "user" "u"
                       ON "i"."assignee_id" = "u"."user_id";

--create output issue comments table
--bit confusing join, but we don't have issue id in comments, so we need to get it first by joining to raw issues table and then deal with referential integrity
CREATE TABLE "out_issue_comment"
AS
    SELECT
        "ic"."id"                                                                      AS "issue_comment_id",
        "i"."issue_id",
        ifnull("u"."user_id", '0')                                                     AS "user_id",
        ifnull("u"."user", 'External User')                                            AS "user",
        IFF(LENGTH("ic"."body") > 1024, LEFT("ic"."body", 1021) || '...', "ic"."body") AS "description",
        replace(left("i"."created_on", 19), 'T', ' ')                                  AS "created_on",
        replace(left("i"."updated_on", 19), 'T', ' ')                                  AS "updated_on",
        "ic"."html_url"                                                                AS "url"
    FROM "issue_comments" "ic"
             LEFT JOIN "out_repository" "r"
                       ON "ic"."repo_name" = "r"."repository"
             LEFT JOIN "issues" "i2"
                       ON "ic"."repo_name" = "i2"."repo_name"
                           AND "ic"."issue_number" = "i2"."number"
             INNER JOIN "out_issue" "i"
                        ON "i2"."id" = "i"."issue_id"
             LEFT JOIN "user" "u"
                       ON "ic"."user_id" = "u"."user_id";

--creating output events table from previously created tables, so it's possible to measure user's overall activity
CREATE TABLE "out_event"
AS
    SELECT
        "pull_request_id" || '_prc' AS "event_id",
        "repository_id",
        "user_id",
        'Pull Request Created'      AS "event",
        "created_on"                AS "date",
        "url"
    FROM "out_pull_request"
    WHERE "created_on" <> ''
    UNION ALL
    SELECT
        "a"."pull_request_activity_id" || '_pra' AS "event_id",
        "r"."repository_id",
        "a"."user_id",
        'Pull Request ' || initcap("a"."state")  AS "event",
        "a"."date"                               AS "date",
        ''                                       AS "url"
    FROM "out_pull_request_activity" "a"
             LEFT JOIN "out_pull_request" "r"
                       ON "a"."pull_request_id" = "r"."pull_request_id"
    WHERE "a"."date" <> ''
    UNION ALL
    SELECT
        "repository_commit_id" || '_c' AS "event_id",
        "repository_id",
        "user_id",
        'Commit'                       AS "event",
        "date"                         AS "date",
        "url"
    FROM "out_repository_commit"
    WHERE "date" <> ''
    UNION ALL
    SELECT
        "issue_id" || '_icr' AS "event_id",
        "repository_id",
        "user_id",
        'Issue Created'      AS "event",
        "created_on"         AS "date",
        "url"
    FROM "out_issue"
    WHERE "created_on" <> ''
    UNION ALL
    SELECT
        "c"."issue_comment_id" || '_ico' AS "event_id",
        "i"."repository_id",
        "c"."user_id",
        'Issue Comment'                  AS "event",
        "c"."created_on"                 AS "date",
        "c"."url"
    FROM "out_issue_comment" "c"
             LEFT JOIN "out_issue" "i"
                       ON "c"."issue_id" = "i"."issue_id"
    WHERE "c"."created_on" <> '';
