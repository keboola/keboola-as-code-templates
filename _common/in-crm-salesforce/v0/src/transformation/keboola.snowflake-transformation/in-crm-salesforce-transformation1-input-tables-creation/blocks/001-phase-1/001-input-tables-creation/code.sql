--account table
CREATE TABLE "account_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "account";

CREATE TABLE "out_account"
(
    "Id" VARCHAR(1024) NOT NULL,
    "IsDeleted" BOOLEAN,
    "Name" VARCHAR(255),
    "Website" VARCHAR(255),
    "CreatedDate" VARCHAR(255)  
);

INSERT INTO "out_account"
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
(
    "Id" VARCHAR(1024) NOT NULL,
    "IsDeleted" BOOLEAN,
    "Name" VARCHAR(255),
    "Email" VARCHAR(255),
    "CreatedDate" VARCHAR(255),
    "LeadSource" VARCHAR(255)
);

INSERT INTO "out_contact"
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
(
    "Id" VARCHAR(1024) NOT NULL,
    "IsDeleted" BOOLEAN,
    "Name" VARCHAR(255),
    "Email" VARCHAR(255),
    "CreatedDate" VARCHAR(255),
    "LeadSource" VARCHAR(255),
    "IsConverted" BOOLEAN
);

INSERT INTO "out_lead"
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
(
    "Id" VARCHAR(1024) NOT NULL,
    "Name" VARCHAR(255),
    "Email" VARCHAR(255),
    "Title" VARCHAR(255)
);

INSERT INTO "out_user"
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
(
    "Id" VARCHAR(1024) NOT NULL,
    "IsDeleted" BOOLEAN,
    "AccountId" VARCHAR(1024),
    "OwnerId" VARCHAR(1024),
    "Name" VARCHAR(255),
    "CreatedDate" VARCHAR(255),
    "CloseDate" VARCHAR(255),
    "IsClosed" BOOLEAN,
    "IsWon" BOOLEAN,
    "StageName" VARCHAR(255),
    "Type" VARCHAR(255),
    "Amount" FLOAT,
    "CurrencyIsoCode" VARCHAR(255),
    "LeadSource" VARCHAR(255),
    "Probability" FLOAT
);

INSERT INTO "out_opportunity"
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
        nullif(trim("obj":"Amount", '"'),'')          AS "Amount",
        trim("obj":"CurrencyIsoCode", '"') AS "CurrencyIsoCode",
        trim("obj":"LeadSource", '"') 	   AS "LeadSource",
        nullif(trim("obj":"Probability", '"'),'')	   AS "Probability"
    FROM "opportunity_tmp";

--opportunitystage table
CREATE TABLE "opportunitystage_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "opportunitystage";

CREATE TABLE "out_opportunitystage"
(
    "Id" VARCHAR(1024) NOT NULL,
    "MasterLabel" VARCHAR(255),
    "SortOrder" INTEGER
);

INSERT INTO "out_opportunitystage"
    SELECT
        trim("obj":"Id", '"')              AS "Id",
        trim("obj":"MasterLabel", '"')     AS "MasterLabel",
        nullif(trim("obj":"SortOrder", '"'),'')       AS "SortOrder"
    FROM "opportunitystage_tmp";

--event table
CREATE TABLE "event_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "event";

CREATE TABLE "out_event"
(
    "Id" VARCHAR(1024) NOT NULL,
    "IsDeleted" BOOLEAN,
    "WhoId" VARCHAR(255),
    "WhatId" VARCHAR(255),
    "OwnerId" VARCHAR(255),
    "Subject" VARCHAR(1024),
    "ActivityDateTime" VARCHAR(255),
    "DurationInMinutes" INTEGER
);

INSERT INTO "out_event"
    SELECT
        trim("obj":"Id", '"')                AS "Id",
        trim("obj":"IsDeleted", '"')         AS "IsDeleted",
        trim("obj":"WhoId", '"')             AS "WhoId",
        trim("obj":"WhatId", '"')            AS "WhatId",
        trim("obj":"OwnerId", '"')           AS "OwnerId",
        trim("obj":"Subject", '"')           AS "Subject",
        trim("obj":"ActivityDateTime", '"')  AS "ActivityDateTime",
        nullif(trim("obj":"DurationInMinutes", '"'),'') AS "DurationInMinutes"
    FROM "event_tmp";

--opportunity contact role table
CREATE TABLE "opportunitycontactrole_tmp"
AS
    SELECT
        OBJECT_CONSTRUCT(*) AS "obj"
    FROM "opportunitycontactrole";

CREATE TABLE "out_opportunitycontactrole"
(
    "Id" VARCHAR(1024) NOT NULL,
    "IsDeleted" BOOLEAN,
    "OpportunityId" VARCHAR(1024),
    "ContactId" VARCHAR(1024),
    "IsPrimary" BOOLEAN,
    "Role" VARCHAR(255)
);

INSERT INTO "out_opportunitycontactrole"
    SELECT
        trim("obj":"Id", '"')            AS "Id",
        trim("obj":"IsDeleted", '"')     AS "IsDeleted",
        trim("obj":"OpportunityId", '"') AS "OpportunityId",
        trim("obj":"ContactId", '"')     AS "ContactId",
        trim("obj":"IsPrimary", '"')     AS "IsPrimary",
        trim("obj":"Role", '"')          AS "Role"
    FROM "opportunitycontactrole_tmp";
