CREATE TABLE "configurations_parsed" AS
SELECT 
  *
FROM 
  "rows_json" c 
 
UNION ALL

SELECT
  *
FROM 
  "configuration_json" c;