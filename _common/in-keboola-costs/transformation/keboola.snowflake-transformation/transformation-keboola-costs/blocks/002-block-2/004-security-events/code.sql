CREATE TABLE "out_security_events" AS
SELECT "security_event_id"                                              AS "security_event_id",
       "kbc_project_id"                                                 AS "project_id",
       LOWER("admin_email")                                             AS "admin_email",
       "admin_name"                                                     AS "admin_name",
       "admin_ip"                                                       AS "admin_ip",
       ev."operation"                                                   AS "security_event",
       "event_created"::DATE                                            AS "event_created_date",
       IFF("token_id" <> '' OR "token_description" <> '',
           APPEND_REGION("token_id", "kbc_project_id", -1) ||
           ' -- ' || "token_description", '')                           AS "token_context",
       IFF("context_admin_email" <> '' OR "context_admin_name" <> '',
           "context_admin_email" || ' -- ' || "context_admin_name", '') AS "admin_context",
       IFF("token_context" = '', "admin_context", "token_context")      AS "event_context"
FROM "security_event" ev
