-- HS_HUBSPOT."PUBLIC".HS_CONTACT_COMPANY_ASSOCIATION
CREATE TABLE HS_CONTACT_COMPANY_ASSOCIATION AS
SELECT DISTINCT
	"canonical_vid" AS CONTACT_ID,
	"associatedcompanyid" AS COMPANY_ID,
	"lifecyclestage" AS TYPE
FROM "contacts";
