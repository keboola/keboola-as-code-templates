SET telemetry_token_suffix = '_Telemetry_token';

/*
UPDATE "md_project_users"
SET "region" = CASE "region"
    WHEN 'us-east-1' THEN 'US'
    WHEN 'eu-central-1' THEN 'EU'
    ELSE "region"
               END;

UPDATE "md_organization_users"
SET "region" = CASE "region"
    WHEN 'us-east-1' THEN 'US'
    WHEN 'eu-central-1' THEN 'EU'
    ELSE "region"
               END;
*/
UPDATE "md_tokens"
SET "region" = CASE "region"
    WHEN 'us-east-1' THEN 'US'
    WHEN 'eu-central-1' THEN 'EU'
    ELSE "region"
               END;

DROP TABLE IF EXISTS "out_users";

CREATE TABLE "out_users"
(
    "user_id"     VARCHAR PRIMARY KEY,
    "user_email"  VARCHAR,
    "user_name"   VARCHAR,
    "user_domain" VARCHAR,
    "mfa_enabled" BOOLEAN
);

/*
INSERT INTO "out_users"
SELECT DISTINCT "id" || '-' || "region",
                LOWER("email"),
                "name",
                LOWER(SPLIT_PART("email", '@', -1)),
                "mfa_enabled"
FROM "md_project_users";

INSERT INTO "out_users"
SELECT DISTINCT "id" || '-' || "region",
                LOWER("email"),
                "name",
                LOWER(SPLIT_PART("email", '@', -1)),
                "mfa_enabled"
FROM "md_organization_users"
WHERE TRUE
  AND "id" || '-' || "region" NOT IN
      (
          SELECT DISTINCT "user_id"
          FROM "out_users"
      );

INSERT INTO "out_users"
SELECT DISTINCT "invitor_id" || '-' || "region",
                LOWER("invitor_email"),
                "invitor_name",
                LOWER(SPLIT_PART("invitor_email", '@', -1)),
                NULL
FROM "md_project_users"
WHERE TRUE
  AND "invitor_id" || '-' || "region" NOT IN
      (
          SELECT DISTINCT "user_id"
          FROM "out_users"
      )
  AND "invitor_id" <> '';

INSERT INTO "out_users"
SELECT DISTINCT "invitor_id" || '-' || "region",
                LOWER("invitor_email"),
                "invitor_name",
                LOWER(SPLIT_PART("invitor_email", '@', -1)),
                NULL
FROM "md_organization_users"
WHERE TRUE
  AND "invitor_id" || '-' || "region" NOT IN
      (
          SELECT DISTINCT "user_id"
          FROM "out_users"
      )
  AND "invitor_id" <> '';

INSERT INTO "out_users"
SELECT DISTINCT "approver_id" || '-' || "region",
                LOWER("approver_email"),
                "approver_name",
                LOWER(SPLIT_PART("approver_email", '@', -1)),
                NULL
FROM "md_project_users"
WHERE TRUE
  AND "approver_id" || '-' || "region" NOT IN
      (
          SELECT DISTINCT "user_id"
          FROM "out_users"
      )
  AND "approver_id" <> '';
*/
INSERT INTO "out_users"
SELECT DISTINCT "admin_id" || '-' || "region",
                LOWER("description"),
                "admin_name",
                LOWER(SPLIT_PART("description", '@', -1)),
                NULL
FROM "md_tokens"
WHERE TRUE
  AND "is_master_token" = TRUE
  AND "admin_id" || '-' || "region" NOT IN
      (
          SELECT DISTINCT "user_id"
          FROM "out_users"
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

--AND "company_id" <> '';

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

-- DROP TABLE IF EXISTS "out_tokens";
CREATE TABLE "out_tokens"
(
    "token_id"              VARCHAR PRIMARY KEY,
    "user_id"               VARCHAR,
    "token_description"     VARCHAR,
    "token_is_master"       BOOLEAN,
    "token_is_orchestrator" BOOLEAN,
    "token_is_expired"      BOOLEAN,
    "token_is_disabled"     BOOLEAN,
    "token_is_telemetry"    BOOLEAN,
    "token_created"         VARCHAR,
    "token_project"         VARCHAR
);

INSERT INTO "out_tokens"
SELECT "id" || '-' || "region",
       "admin_id" || '-' || "region",
       "description",
       "is_master_token",
       FALSE,
       IFF(CONVERT_KBC_TIMESTAMP("expires")::TIMESTAMP_TZ > CURRENT_TIMESTAMP(), TRUE, FALSE),
       "is_disabled",
       FALSE,
       CONVERT_KBC_TIMESTAMP("created"),
       "project_id" || '-' || "region"
FROM "md_tokens"
WHERE TRUE
  AND "is_master_token"::BOOLEAN = TRUE;

INSERT INTO "out_tokens"
SELECT DISTINCT t."id" || '-' || t."region",
                u."user_id",
                t."description",
                "is_master_token",
                IFF(t."description" LIKE 'Orchestrator%', TRUE, FALSE),
                IFF(CONVERT_KBC_TIMESTAMP("expires")::TIMESTAMP_TZ > CURRENT_TIMESTAMP(), TRUE, FALSE),
                "is_disabled",
                IFF(t."description" LIKE '%' || $telemetry_token_suffix, TRUE, FALSE),
                CONVERT_KBC_TIMESTAMP("created"),
                "project_id" || '-' || "region"
FROM "md_tokens" t
     LEFT JOIN "out_users" u
                ON u."user_email" = LOWER(t."creator_token_description")
WHERE TRUE
  AND t."id" || '-' || t."region" NOT IN
      (
          SELECT DISTINCT "token_id"
          FROM "out_tokens"
      );

INSERT INTO "out_tokens"
SELECT DISTINCT t."id" || '-' || t."region",
                'N/A-' || "region",
                t."description",
                "is_master_token",
                IFF(t."description" LIKE 'Orchestrator%', TRUE, FALSE),
                IFF(CONVERT_KBC_TIMESTAMP("expires")::TIMESTAMP_TZ > CURRENT_TIMESTAMP(), TRUE, FALSE),
                "is_disabled",
                IFF(t."description" LIKE '%' || $telemetry_token_suffix, TRUE, FALSE),
                CONVERT_KBC_TIMESTAMP("created"),
                "project_id" || '-' || "region"
FROM "md_tokens" t
WHERE TRUE
  AND t."id" || '-' || t."region" NOT IN
      (
          SELECT DISTINCT "token_id"
          FROM "out_tokens"
      );

INSERT INTO "out_tokens"
SELECT 'N/A-US',
       'N/A-US',
       'Unknown',
       FALSE,
       FALSE,
       FALSE,
       FALSE,
       FALSE,
       '2012-01-01 00:00:00 Z',
       'N/A-US';

INSERT INTO "out_tokens"
SELECT 'N/A-EU',
       'N/A-EU',
       'Unknown',
       FALSE,
       FALSE,
       FALSE,
       FALSE,
       FALSE,
       '2012-01-01 00:00:00 Z',
       'N/A-EU';

CREATE TABLE "out_tokens_last_events" AS
SELECT "token_id" AS "token_id",
       "event_id" AS "token_event_id",
       "event" AS "token_event_name",
       "message" AS "token_event_message",
       CONVERT_KBC_TIMESTAMP("event_created") AS "token_event_created"
FROM "md_tokens_events";

/*
CREATE TABLE "out_users_projects" AS
SELECT CONCAT_WS('-', "id", "region")                      AS "user_id",
       CONCAT_WS('-', "project_id", "region")              AS "project_id",
       MD5(CONCAT_WS('|', "project_id", "user_id"))        AS "user_project_access_id",
       CONVERT_KBC_TIMESTAMP("created")                    AS "created",
       CONVERT_KBC_TIMESTAMP("expires")                    AS "expires",
       "role",
       "reason",
       "status",
       CONCAT_WS('-', NULLIF("invitor_id", ''), "region")  AS "invitor_user_id",
       CONCAT_WS('-', NULLIF("approver_id", ''), "region") AS "approver_user_id"
FROM "md_project_users";

CREATE TABLE "out_users_organizations" AS
SELECT CONCAT_WS('-', "id", "region")                     AS "user_id",
       CONCAT_WS('-', "organization_id", "region")        AS "organization_id",
       CONVERT_KBC_TIMESTAMP("created")                   AS "created",
       CONCAT_WS('-', NULLIF("invitor_id", ''), "region") AS "invitor_user_id"
FROM "md_organization_users";
*/
