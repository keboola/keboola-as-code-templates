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
CREATE OR REPLACE TABLE `insights_pivoted` AS 
SELECT
       parent_id 					AS parent_id,
        MIN(engagement) 	AS engagement,
        MIN(impressions) 	AS impressions,
        MIN(reach) 				AS reach,
        MIN(saved) 				AS saved
   
    FROM
        (
            SELECT
                *
            FROM
                `instagram_media_lifetime_insights`
       					)PIVOT (
            MAX(value) FOR name IN ('engagement', 'impressions', 'reach', 'saved')
        )
 
    GROUP BY
        parent_id;


INSERT INTO `posts_engagement`
SELECT
    CONCAT(
        SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(timestamp, '+0000', '')) AS DATE),
        '-instagram-',
        media.id
    ) 																																															AS uid,
    media.id 																																												AS post_id,
    'instagram' 																																										AS source,
    SAFE_CAST(PARSE_TIMESTAMP('%Y-%m-%dT%H:%M:%S', REPLACE(timestamp, '+0000', '')) AS DATE) 				AS date,
    caption 																																												AS post_text,
    0 																																															AS shares,
    0 																																															AS views,
    IFNULL(SAFE_CAST(like_count AS INT64), 0) 																											AS likes,
    IFNULL(SAFE_CAST(comments_count AS INT64), 0) 																									AS comments,
    IFNULL(SAFE_CAST(comments_count AS INT64), 0) + IFNULL(SAFE_CAST(like_count AS INT64), 0) 			AS all_reactions
FROM
    `instagram_media` AS media
    	LEFT JOIN `insights_pivoted` AS insights_pivoted
    			ON media.id = insights_pivoted.parent_id;
