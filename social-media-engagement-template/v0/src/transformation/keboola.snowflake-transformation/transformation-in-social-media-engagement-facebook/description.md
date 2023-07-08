This transformation takes feed, feed_likes_summary and page_insights tables from facebook extractor and transform them to following output tables:

**pages_engagement** table from page_insights input table

**posts_engagement** table from feed and feed_likes_summary



DETAILS:


**pages_engagement** table
- source
- "date"
- "page_fans"
- "page_views_total"
- "page_impressions"


**posts_engagement**
- "id"
- 'facebook' as "source"
- "date"
- "text"
- "share_count"
