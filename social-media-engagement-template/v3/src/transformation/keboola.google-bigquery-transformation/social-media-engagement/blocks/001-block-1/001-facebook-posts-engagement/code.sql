CREATE TABLE IF NOT EXISTS `posts_engagement`
(
    uid           STRING NOT NULL,
    post_id       STRING,
    source        STRING,
    date          DATE,
    post_text     STRING,
    shares        INT64,
    views         INT64,
    likes         INT64,
    comments      INT64,
    all_reactions INT64
);

INSERT INTO `posts_engagement`
SELECT
    CONCAT(
     SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(created_time, '+0000', '')) AS DATE),
        '-facebook-',
        id
    ) 																																													AS uid,
    id 																																													AS post_id,
    'facebook' 																																									AS source,
    SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(created_time, '+0000', '')) AS DATE) AS date,
    message 																																										AS post_text,
   	IFNULL(SAFE_CAST(shares_count AS INT64), 0) 																								AS shares,
    0 																																													AS views,
   	IFNULL(SAFE_CAST(total_count AS INT64), 0) 																									AS likes,
    0 																																													AS comments,
   	IFNULL(SAFE_CAST(shares_count AS INT64), 0) +  IFNULL(SAFE_CAST(total_count AS INT64), 0) 	AS all_reactions
FROM
   `facebook_feed` t1
    LEFT JOIN `facebook_feed_likes_summary`  t2
   				ON t1.id = t2.parent_id;
