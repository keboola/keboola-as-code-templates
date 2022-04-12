CREATE OR REPLACE TABLE "data_quality_check"
(
    DATA_SOURCE STRING,
    ENTITY      STRING,
    ERROR_TYPE  STRING,
    DESCRIPTION STRING
);

INSERT INTO "data_quality_check"
    (DATA_SOURCE, ENTITY, ERROR_TYPE, DESCRIPTION)
SELECT 'sklad'                                                       AS DATA_SOURCE
     , 'stocks'                                                      AS ENTITY
     , 'duplicities'                                                 AS ERROR_TYPE
     , 'Duplicated itemName:' || S1."itemName" || ' found in sklad.' AS DESCRIPTION
FROM "stocks" S1
WHERE "itemName" IN
      (
          SELECT S2."itemName"
          FROM "stocks" S2
          GROUP BY S2."itemName"
          HAVING COUNT(1) > 1
      );

INSERT INTO "data_quality_check"
    (DATA_SOURCE, ENTITY, ERROR_TYPE, DESCRIPTION)
SELECT 'sklad'                                                       AS DATA_SOURCE
     , 'stocks'                                                      AS ENTITY
     , 'duplicities'                                                 AS ERROR_TYPE
     , 'Duplicated itemCode:' || S1."itemCode" || ' found in sklad.' AS DESCRIPTION
FROM "stocks" S1
WHERE "itemCode" IN
      (
          SELECT S2."itemCode"
          FROM "stocks" S2
          GROUP BY S2."itemCode"
          HAVING COUNT(1) > 1
      );
