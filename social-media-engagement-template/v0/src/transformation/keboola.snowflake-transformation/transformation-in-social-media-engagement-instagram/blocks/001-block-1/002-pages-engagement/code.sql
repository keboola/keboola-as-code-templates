CREATE OR REPLACE TABLE "pages_engagement" AS
    select
        'instagram' as "source",
        try_to_date(replace("""end_time""", '+0000')) as "date",
        min("'impressions'") as "page_posts_impressions",
        min("'follower_count'") as "page_followers",
        min("'profile_views'") as "page_views_total"     
        
        
        
    from
        (select * from "page_daily_insights")
        PIVOT (max("value") for "name" in ('reach', 'website_clicks', 'phone_call_clicks', 'email_contacts', 'profile_views', 'get_directions_clicks', 'text_message_clicks', 'impressions', 'follower_count'))
        
    group by "date"
