CREATE TABLE "ga4_event"
(
		"id" VARCHAR(2000) NOT NULL
    ,"idProperty" VARCHAR(255)
    ,"date" DATE
    ,"eventName" VARCHAR(255)
    ,"isConversionEvent" BOOLEAN
    -- metrics
    ,"eventCount" INTEGER
    ,"eventValue" INTEGER
    ,"totalUsers" INTEGER
    ,"activeUsers" INTEGER
    ,"newUsers" INTEGER
);

INSERT INTO "ga4_event"
  SELECT 
    -- dimensions
    "id"
    ,"idProperty"
    ,"date"
    ,"eventName"
    ,IFF("isConversionEvent" = true, true, false) as "isConversionEvent"
    -- metrics
    ,"eventCount"
    ,"eventValue"
    ,"totalUsers"
    ,"activeUsers"
    ,"newUsers"
	FROM "raw_event"
;
