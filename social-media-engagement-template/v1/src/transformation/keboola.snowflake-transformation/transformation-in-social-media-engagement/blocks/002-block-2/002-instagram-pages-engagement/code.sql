CREATE TABLE IF NOT EXISTS "pages_engagement"
(
    "source" VARCHAR(255) NOT NULL,
    "date" DATE NOT NULL,
    "page_followers" INTEGER,
    "page_views_total" INTEGER,
    "page_posts_impressions" INTEGER
);

INSERT INTO "pages_engagement"
    SELECT
        'instagram' as "source",
        try_to_date(replace("""end_time""", '+0000')) as "date",
        min("'impressions'") as "page_posts_impressions",
        min("'follower_count'") as "page_followers",
        min("'profile_views'") as "page_views_total"     
    FROM
        (SELECT * FROM "instagram-page_daily_insights")
        PIVOT (max("value") for "name" IN ('reach', 'website_clicks', 'phone_call_clicks', 'email_contacts', 'profile_views', 'get_directions_clicks', 'text_message_clicks', 'impressions', 'follower_count'))
    GROUP BY "date";
