--create output repository table
--change flags to true/false
--format date
--mark Looker repositories based on changed files
                      
CREATE TABLE `out_repository`
(
    repository_id STRING NOT NULL,
    repository STRING,
    project STRING,
    description STRING,
    language STRING,
    has_wiki BOOLEAN,
    has_issues BOOLEAN,
    is_private BOOLEAN,
    created_on DATETIME,
    url STRING
);

INSERT INTO `out_repository`
    SELECT
        r.id                                            									AS repository_id,
        r.name                                         										AS repository,
        ''                                                  							AS project,
        if(length(r.description) > 1024, CONCAT( left(r.description, 1021), '...'),
            r.description)                             										AS description,
        if(r.language = '', 'unknown', r.language     ) 									AS language,
        if(r.has_wiki = '1', TRUE, FALSE)          												AS has_wiki,
        if(r.has_issues = '1', TRUE, FALSE)        												AS has_issues,
        if(r.private = '1', TRUE, FALSE)           												AS is_private,
        CAST(replace(left(r.created_at, 19), 'T', ' ') AS DATETIME)       AS created_on,
        r.html_url                                      									AS url
    FROM `repos` r;

--format dates
--referential integrity check
--define if closed pull request is declined or merged
CREATE TABLE `out_pull_request`
(
    pull_request_id STRING NOT NULL,
    repository_id STRING,
    user_id STRING,
    title STRING,
    description STRING,
    state STRING,
    created_on DATETIME,
    updated_on DATETIME,
    url STRING
);

INSERT INTO `out_pull_request`
    SELECT
        p.id                                     									AS pull_request_id,
        r.repository_id,
        ifnull(u.user_id, '0')                    								AS user_id,
        p.title,
        if(length(p.body) > 1024, CONCAT(left(p.body, 1021),'...'),
            p.body)                               								AS description,
        (CASE
             WHEN p.state = 'closed' AND p.merged_at = ''
                 THEN 'declined'
             WHEN p.state = 'closed' AND p.merged_at <> ''
                 THEN 'merged'
             ELSE p.state
         END)                                         						AS state,
       CAST(replace(left(p.created_at, 19), 'T', ' ')AS DATETIME) AS created_on,
       CAST(replace(left(p.updated_at, 19), 'T', ' ')AS DATETIME) AS updated_on,
        p.html_url                               									AS url
    FROM `pulls` p
             INNER JOIN `out_repository` r
                        ON p.repo_name = r.repository
             LEFT JOIN `user` u
                       ON p.user_id = u.user_id;

--easy deduplication of activity (there is no state which can change during time)
--format columns                                     
CREATE TABLE `out_pull_request_activity`
(
    pull_request_activity_id STRING NOT NULL,
    pull_request_id STRING,
    user_id STRING,
    user STRING,
    date DATETIME,
    state STRING,
    title STRING,
    description STRING,
    reason STRING
);

INSERT INTO `out_pull_request_activity`
    SELECT DISTINCT
        CONCAT(opr.repository_id, '_', opr.pull_request_id, '_',pr.state, '_',
        left(pr.submitted_at, 19))                                             		AS pull_request_activity_id,
        opr.pull_request_id,
        ifnull(u.user_id, '0')                                                		AS user_id,
        ifnull(u.user, 'External User')                                       		AS user,
        CAST(replace(left(pr.submitted_at, 19), 'T', ' ') AS DATETIME)          	AS date,
        pr.state,
        left(coalesce(pc.body, pr.body), 255)                                 		AS title,
        if(length(coalesce(pc.body, pr.body)) > 1024,
        CONCAT(left(coalesce(pc.body, pr.body), 1021),'...'), pr.body)    				AS description,
        ''                                                         								AS reason
    FROM `pull_reviews` pr
             INNER JOIN `out_pull_request` opr
                        ON SPLIT(pr.html_url, '#')[SAFE_OFFSET(0)] = opr.url
             LEFT JOIN `user` u
                       ON pr.user_id = u.user_id
             LEFT JOIN `pull_comments` pc
                       ON pr.id = pc.pull_review_id
    WHERE pr.state <> '';
      
--insert comments on pull request (those are gathered from issues endpoint)
--check if the timestamp is same as closing the request (GitHub action "comment and close") and mark such activity as 'DECLINED'
--format dates
INSERT INTO `out_pull_request_activity`
    (pull_request_activity_id, pull_request_id, user_id, user, date, state, title, description,
     reason)
SELECT
        CONCAT(opr.repository_id, '_', opr.pull_request_id,'_COMMENTED_',
        left(pic.created_at, 19))                    										AS pull_request_activity_id,
        opr.pull_request_id,
        ifnull(u.user_id, '0')                      										AS user_id,
        ifnull(u.user, 'External User')             										AS user,
        CAST(replace(left(pic.created_at, 19), 'T', ' ') AS DATETIME) 	AS date,
        if(p.id IS NULL, 'COMMENTED', 'DECLINED')  											AS state,
        left(pic.body, 255)                         										AS title,
        if(length(pic.body) > 1024, CONCAT(left(pic.body, 1021),'...'),
            pic.body)                               										AS description,
        if(p.id IS NULL, '', if(length(pic.body) > 1024, CONCAT(left(pic.body, 1021),'...'),
                                      pic.body))    										AS reason
FROM `pull_issue_comments` pic
         INNER JOIN `out_pull_request` opr
                    ON SPLIT(pic.html_url, '#')[SAFE_OFFSET(0)] = opr.url
         LEFT JOIN `user` u
                   ON pic.user_id = u.user_id
         LEFT JOIN `pulls` p
                   ON opr.pull_request_id = p.id
                       AND pic.created_at = p.closed_at;

--add merge activity
INSERT INTO `out_pull_request_activity`
    (pull_request_activity_id, pull_request_id, user_id, user, date, state, title, description,
     reason)
SELECT
        CONCAT(r.repository_id, '_',p.id,'_MERGED_',
        left(p.merged_at, 19))                   										AS pull_request_activity_id,
        p.id                                     										AS pull_request_id,
        ifnull(u.user_id, '0')                   										AS user_id,
        ifnull(u.user, 'External User')          										AS user,
        CAST(replace(left(p.merged_at, 19), 'T', ' ')AS DATETIME) 	AS date,
        'MERGED'                                     								AS state,
        p.title,
        if(length(p.body) > 1024, CONCAT( left(p.body, 1021), '...'),
            p.body)                              										AS description,
        ''                                          								AS reason
FROM `pulls` p
         INNER JOIN `out_repository` r
                    ON p.repo_name = r.repository
         LEFT JOIN `user` u
                   ON p.user_id = u.user_id
WHERE p.merged_at <> '';


--create output commits table
CREATE TABLE `out_repository_commit`
(
    repository_commit_id STRING NOT NULL,
    repository_id STRING,
    user_id STRING,
    date DATETIME,
    url STRING,
    message STRING
);

INSERT INTO `out_repository_commit`
    SELECT
        c.sha                                             									AS repository_commit_id,
        ort.repository_id,
        ifnull(u.user_id, '0')                            									AS user_id,
        CAST (replace(left(c.commit_author_date, 19), 'T', ' ')AS DATETIME) AS date,
        c.html_url                                       										AS url,
        if(length(c.commit_message) > 1024, CONCAT(left(c.commit_message, 1021), '...'),
        c.commit_message)                             											AS message
    FROM `commits` c
             INNER JOIN `out_repository` ort
                        ON c.repo_name = ort.repository
             LEFT JOIN `user` u
                       ON c.author_id = u.user_id;

--create output issues table
CREATE TABLE `out_issue`
(
    issue_id STRING NOT NULL,
    repository_id STRING,
    user_id STRING,
    reporter STRING,
    number STRING,
    title STRING,
    description STRING,
    state STRING,
    priority STRING,
    kind STRING,
    created_on DATETIME,
    updated_on DATETIME,
    url STRING
);

INSERT INTO `out_issue`
    SELECT
        i.id                                                                    AS issue_id,
        r.repository_id                                                         AS repository_id,
        ifnull(u.user_id, '0')                                                  AS user_id,
        i.user_login                                                            AS reporter,
        i.id                                                                    AS number,
        i.title,
        IF(LENGTH(i.body) > 1024, CONCAT (LEFT(i.body, 1021), '...'), i.body)   AS description,
        i.state,
        ''                                                                      AS priority,
        ''                                                                      AS kind,
        CAST(replace(left(i.created_at, 19), 'T', ' ') AS DATETIME)             AS created_on,
        CAST(replace(left(i.updated_at, 19), 'T', ' ') AS DATETIME)             AS updated_on,
        i.html_url                                                              AS url
    FROM `issues` i
             INNER JOIN `out_repository` r
                        ON i.repo_name = r.repository
             LEFT JOIN `user` u
                       ON i.assignee_id = u.user_id;
                      

--create output issue comments table
--bit confusing join, but we don't have issue id in comments, so we need to get it first by joining to raw issues table and then deal with referential integrity                   
CREATE TABLE `out_issue_comment`
(
    issue_comment_id STRING NOT NULL,
    issue_id STRING,
    user_id STRING,
    user STRING,
    description STRING,
    created_on DATETIME,
    updated_on DATETIME,
    url STRING
);

INSERT INTO `out_issue_comment`
    SELECT
        ic.id                                                                      	AS issue_comment_id,
        i.issue_id,
        ifnull(u.user_id, '0')                                                    	AS user_id,
        ifnull(u.user, 'External User')                                          	  AS user,
        IF(LENGTH(ic.body) > 1024, CONCAT(LEFT(ic.body, 1021),'...'), ic.body)   	  AS description,   
        i.created_on                                     														AS created_on,
        i.updated_on                                      													AS updated_on,
        ic.html_url                                                               	AS url
    FROM `issue_comments` ic
             LEFT JOIN `out_repository` r
                       ON ic.repo_name = r.repository
             LEFT JOIN `issues` i2
                       ON ic.repo_name = i2.repo_name
                           AND ic.issue_number = i2.number
             INNER JOIN `out_issue` i
                        ON i2.id = i.issue_id
             LEFT JOIN `user` u
                       ON ic.user_id = u.user_id;

--creating output events table from previously created tables, so it's possible to measure user's overall activity
CREATE TABLE `out_event`
(
    event_id STRING NOT NULL,
    repository_id STRING,
    user_id STRING,
    event STRING,
    date DATETIME,
    url STRING
);

INSERT INTO `out_event`
    SELECT
        CONCAT(pull_request_id, '_prc') 	AS event_id,
        repository_id,
        user_id,
        'Pull Request Created'      			AS event,
        created_on                 				AS date,
        url
    FROM `out_pull_request`
    WHERE created_on IS NOT NULL
    UNION ALL
    SELECT
       CONCAT( a.pull_request_activity_id, '_pra') 	AS event_id,
        r.repository_id,
        a.user_id,
        CONCAT('Pull Request ', initcap(a.state))  	AS event,
        a.date                               				AS date,
      	''                                   				AS url
    FROM `out_pull_request_activity` a
             LEFT JOIN `out_pull_request` r
                       ON a.pull_request_id = r.pull_request_id
    WHERE a.date IS NOT NULL
    UNION ALL
    SELECT
       CONCAT(repository_commit_id, '_c') AS event_id,
        repository_id,
        user_id,
        'Commit'                       		AS event,
        date                        			AS date,
        url
    FROM `out_repository_commit`
    WHERE date IS NOT NULL
    UNION ALL
    SELECT
        CONCAT(issue_id, '_icr') AS event_id,
        repository_id,
        user_id,
        'Issue Created'      		 AS event,
        created_on           		 AS date,
        url
    FROM `out_issue`
    WHERE created_on IS NOT NULL
    UNION ALL
    SELECT
        CONCAT(c.issue_comment_id,'_ico') AS event_id,
        i.repository_id,
        c.user_id,
        'Issue Comment'                  	AS event,
        c.created_on                			AS date,
        c.url
    FROM `out_issue_comment` c
             LEFT JOIN `out_issue` i
                       ON c.issue_id = i.issue_id
    WHERE c.created_on IS NOT NULL;
