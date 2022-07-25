SET telemetry_token_suffix = '_Telemetry_token';

DROP TABLE IF EXISTS "out_users";

CREATE TABLE "out_users"
(
    "user_id"     VARCHAR PRIMARY KEY,
    "user_email"  VARCHAR,
    "user_name"   VARCHAR,
    "user_domain" VARCHAR,
    "mfa_enabled" BOOLEAN
);

INSERT INTO "out_users"
SELECT DISTINCT "user_id" || '-' || SPLIT_PART("kbc_project_id", '-', -1) AS usr_id,
                LOWER("email"),
                NULL::VARCHAR,
                LOWER("domain"),
                NULL
FROM "kbc_project_user"
WHERE TRUE
  AND usr_id NOT IN
      (
          SELECT DISTINCT "user_id"
          FROM "out_users"
      );

INSERT INTO "out_users"
SELECT 'N/A-US',
       'no@email.com',
       'Other',
       'Other',
       NULL;

INSERT INTO "out_users"
SELECT 'N/A-EU',
       'no@email.com',
       'Other',
       'Other',
       NULL;
