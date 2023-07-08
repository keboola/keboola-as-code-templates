From time_bound_page_statistics and time_bound_share_statistics input tables creates

**pages_insight**
- 'linkedin' as "source"
- "date"
- likeCount as "page_fans"
- views_allPageViews_pageViews as "page_views_total"
- impressionCount as "page_impressions"



From posts and likes input tables creates

**all_posts**
- "id"
- 'linkedin' as "source"
- createdAt as "date"
- commentary as "text"
- count of post_urn as "like_count",
