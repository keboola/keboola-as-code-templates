CREATE TABLE "pages_engagement"
(
        "source" VARCHAR(255) NOT NULL,
        "date" DATE NOT NULL,
        "page_followers" INTEGER,
        "page_views_total" INTEGER,
        "page_posts_impressions" INTEGER
);

INSERT INTO "pages_engagement"
	SELECT
  	'facebook' as "source",
        try_to_date(replace("""end_time""", '+0000')) as "date",       
        min("'page_fans'") as "page_followers",        
        min("'page_views_total'") as "page_views_total",
        min("'page_impressions'") as "page_posts_impressions"
	FROM
        (SELECT * FROM "page_insights" WHERE "period"='day')
        PIVOT (max("value") for "name" IN ('page_fan_adds', 'page_negative_feedback', 'page_views_total', 'page_impressions', 'page_consumptions', 'page_engaged_users', 'page_fans', 'page_fan_removes'))
        
        WHERE "date" < GETDATE()
        GROUP BY "date";
