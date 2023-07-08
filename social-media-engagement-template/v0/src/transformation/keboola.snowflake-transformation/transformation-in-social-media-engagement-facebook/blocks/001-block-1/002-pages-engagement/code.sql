CREATE OR REPLACE TABLE "pages_engagement" AS
	select
  			'facebook' as "source",
        try_to_date(replace("""end_time""", '+0000')) as "date",       
        min("'page_fans'") as "page_followers",        
        min("'page_views_total'") as "page_views_total",
        min("'page_impressions'") as "page_posts_impressions"
        
        
        
	from
        (select * from "page_insights" where "period"='day')
        PIVOT (max("value") for "name" in ('page_fan_adds', 'page_negative_feedback', 'page_views_total', 'page_impressions', 'page_consumptions', 'page_engaged_users', 'page_fans', 'page_fan_removes'))
        
    where "date" < GETDATE()
    group by "date"
