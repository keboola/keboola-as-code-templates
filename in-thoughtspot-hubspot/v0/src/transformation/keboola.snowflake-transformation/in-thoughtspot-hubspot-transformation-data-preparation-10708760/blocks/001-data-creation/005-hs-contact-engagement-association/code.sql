-- HS_HUBSPOT."PUBLIC".HS_CONTACT_ENGAGEMENT_ASSOCIATION
CREATE TABLE HS_CONTACT_ENGAGEMENT_ASSOCIATION AS
SELECT DISTINCT
	replace(F.value,'""','') AS CONTACT_ID,
	"engagement_id" AS ENGAGEMENT_ID
FROM "activities", Table(Flatten(strtok_to_array(replace(replace("activities"."associations_contactIds",'[',''),']',''),', '))) F;
