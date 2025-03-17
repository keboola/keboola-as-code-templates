CREATE OR REPLACE TABLE "campaign_budget" (
  	"src_id" VARCHAR(100),
  	"client" VARCHAR(100),
    "budget" VARCHAR(100),
    "budget_amount" NUMBER(24, 3),
    "currency" VARCHAR(100),
    "since_date" DATE,
    "until_date" DATE,
    "campaigns"  VARCHAR(16777216)
);
