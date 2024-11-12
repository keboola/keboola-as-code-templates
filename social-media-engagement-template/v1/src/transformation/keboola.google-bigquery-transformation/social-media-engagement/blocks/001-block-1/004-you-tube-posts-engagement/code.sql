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
    SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', snippet_publishedAt) AS DATE),
        '-youtube-',
        id
    ) 																																										AS uid,
    id 																																										AS post_id,
    'youtube' 																																						AS source,
     SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%SZ', snippet_publishedAt) AS DATE) 				AS date,
   	snippet_title 																																				AS post_text,
   	0 																																										AS shares,
  	IFNULL(CAST(statistics_viewCount AS INT64), 0) 																				AS views,
  	IFNULL(CAST(statistics_likeCount AS INT64), 0) 																				AS likes,
  	IFNULL(CAST(statistics_commentCount AS INT64), 0) 																		AS comments,
  	IFNULL(CAST(statistics_likeCount AS INT64), 0) + IFNULL(CAST(statistics_favoriteCount AS INT64), 0) +  IFNULL(CAST(statistics_commentCount AS INT64), 0) 																																													 AS all_reactions
FROM
    `youtube_videosDetail`;
