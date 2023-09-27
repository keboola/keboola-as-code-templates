Transformation returning two tables:

**all_posts**
- created_at as "date"
- "text"
- retweet_count as "share_count"
- favorite_count as "like_count"

**pages-insight**
- current date as "date"
- sum of unique ids from users table where the source is followersList as "page_fans"
