--account table
CREATE TABLE "account_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "account";

CREATE TABLE "out_account"
AS
    SELECT
        trim("obj":"Id", '"')          AS "Id",
        trim("obj":"IsDeleted", '"')   AS "IsDeleted",
        trim("obj":"Name", '"')        AS "Name",
        trim("obj":"Website", '"')     AS "Website",
        trim("obj":"CreatedDate", '"') AS "CreatedDate"
    FROM "account_tmp";

--contact table
CREATE TABLE "contact_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "contact";

CREATE TABLE "out_contact"
AS
    SELECT
        trim("obj":"Id", '"')          AS "Id",
        trim("obj":"IsDeleted", '"')   AS "IsDeleted",
        trim("obj":"Name", '"')        AS "Name",
        trim("obj":"Email", '"')       AS "Email",
        trim("obj":"CreatedDate", '"') AS "CreatedDate",
        trim("obj":"LeadSource", '"')  AS "LeadSource"
    FROM "contact_tmp";

--lead table
CREATE TABLE "lead_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "lead";

CREATE TABLE "out_lead"
AS
    SELECT
        trim("obj":"Id", '"')          AS "Id",
        trim("obj":"IsDeleted", '"')   AS "IsDeleted",
        trim("obj":"Name", '"')        AS "Name",
        trim("obj":"Email", '"')       AS "Email",
        trim("obj":"CreatedDate", '"') AS "CreatedDate",
        trim("obj":"LeadSource", '"')  AS "LeadSource",
        trim("obj":"IsConverted", '"') AS "IsConverted"
    FROM "lead_tmp";

--user table
CREATE TABLE "user_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "user";

CREATE TABLE "out_user"
AS
    SELECT
        trim("obj":"Id", '"')    AS "Id",
        trim("obj":"Name", '"')  AS "Name",
        trim("obj":"Email", '"') AS "Email",
        trim("obj":"Title", '"') AS "Title"
    FROM "user_tmp";

--opportunity table
CREATE TABLE "opportunity_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "opportunity";

CREATE TABLE "out_opportunity"
AS
    SELECT
        trim("obj":"Id", '"')              AS "Id",
        trim("obj":"IsDeleted", '"')       AS "IsDeleted",
        trim("obj":"AccountId", '"')       AS "AccountId",
        trim("obj":"OwnerId", '"')         AS "OwnerId",
        trim("obj":"Name", '"')            AS "Name",
        trim("obj":"CreatedDate", '"')     AS "CreatedDate",
        trim("obj":"CloseDate", '"')       AS "CloseDate",
        trim("obj":"IsClosed", '"')        AS "IsClosed",
        trim("obj":"IsWon", '"')           AS "IsWon",
        trim("obj":"StageName", '"')       AS "StageName",
        trim("obj":"Type", '"')            AS "Type",
        trim("obj":"Amount", '"')          AS "Amount",
        trim("obj":"CurrencyIsoCode", '"') AS "CurrencyIsoCode",
        trim("obj":"LeadSource", '"') 	   AS "LeadSource",
        trim("obj":"Probability", '"')	   AS "Probability"
    FROM "opportunity_tmp";

--opportunitystage table
CREATE TABLE "opportunitystage_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "opportunitystage";

CREATE TABLE "out_opportunitystage"
AS
    SELECT
        trim("obj":"Id", '"')              AS "Id",
        trim("obj":"MasterLabel", '"')     AS "MasterLabel",
        trim("obj":"SortOrder", '"')       AS "SortOrder"
    FROM "opportunitystage_tmp";

--event table
CREATE TABLE "event_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "event";

CREATE TABLE "out_event"
AS
    SELECT
        trim("obj":"Id", '"')                AS "Id",
        trim("obj":"IsDeleted", '"')         AS "IsDeleted",
        trim("obj":"WhoId", '"')             AS "WhoId",
        trim("obj":"WhatId", '"')            AS "WhatId",
        trim("obj":"OwnerId", '"')           AS "OwnerId",
        trim("obj":"Subject", '"')           AS "Subject",
        trim("obj":"ActivityDateTime", '"')  AS "ActivityDateTime",
        trim("obj":"DurationInMinutes", '"') AS "DurationInMinutes"
    FROM "event_tmp";

--opportunity contact role table
CREATE TABLE "opportunitycontactrole_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "opportunitycontactrole";

CREATE TABLE "out_opportunitycontactrole"
AS
    SELECT
        trim("obj":"Id", '"')            AS "Id",
        trim("obj":"IsDeleted", '"')     AS "IsDeleted",
        trim("obj":"OpportunityId", '"') AS "OpportunityId",
        trim("obj":"ContactId", '"')     AS "ContactId",
        trim("obj":"IsPrimary", '"')     AS "IsPrimary",
        trim("obj":"Role", '"')          AS "Role"
    FROM "opportunitycontactrole_tmp";
