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
   CONCAT(CAST(TIMESTAMP_MILLIS(CAST(createdAt AS INT64)) AS DATE), '-linkedin-', id) 		AS uid,  
   id 																																										AS post_id,
   'linkedin' 																																						AS source,
   CAST(TIMESTAMP_MILLIS(CAST(createdAt AS INT64)) AS DATE) 															AS date,
   commentary 																																						AS post_text,
   0 																																											AS shares,
   0 																																											AS views,
   IFNULL(COUNT(post_urn), 0) 																														AS likes,
   0 																																											AS comments,
   IFNULL(COUNT(post_urn), 0) 																														AS all_reactions
FROM
    `linkedin_posts` AS posts
    		LEFT OUTER JOIN `linkedin_likes` AS likes 
       				ON posts.id = likes.post_urn
GROUP BY
    id,
    createdAt,
    commentary;
