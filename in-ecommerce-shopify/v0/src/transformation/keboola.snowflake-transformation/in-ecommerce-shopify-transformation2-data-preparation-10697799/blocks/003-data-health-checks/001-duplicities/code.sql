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
     , 'inventory_items'                                             AS ENTITY
     , 'duplicities'                                                 AS ERROR_TYPE
     , 'Duplicated product:' || P."title" || ' - ' || 
     CASE 
        WHEN PV."option1" NOT IN ('S','XS', 'M', 'L', 'XL', 'XXL', 'XXXL') THEN PV."option1" 
        ELSE PV."option2" 
     END
     ||' / '||
     CASE 
        WHEN PV."option1" IN ('S','XS', 'M', 'L', 'XL', 'XXL', 'XXXL') THEN PV."option1" 
        ELSE PV."option2" 
     END
     ||' found in sklad.'                                           AS DESCRIPTION
FROM "product_variant" PV
    LEFT JOIN "product"P 
        ON P."id" = PV."product_id"
WHERE P."title" || ' - ' || 
     CASE 
        WHEN PV."option1" NOT IN ('S','XS', 'M', 'L', 'XL', 'XXL', 'XXXL')THEN PV."option1" 
        ELSE PV."option2" 
     END
     ||' / '||
     CASE 
        WHEN PV."option1" IN ('S','XS', 'M', 'L', 'XL', 'XXL', 'XXXL') THEN PV."option1" 
        ELSE PV."option2" 
     END
            IN
      (
          SELECT P."title" || ' - ' || 
                 CASE 
                    WHEN PV."option1" NOT IN ('S','XS', 'M', 'L', 'XL', 'XXL', 'XXXL') THEN PV."option1" 
                    ELSE PV."option2" 
                 END
                 ||' / '||
                 CASE 
                    WHEN PV."option1" IN ('S','XS', 'M', 'L', 'XL', 'XXL', 'XXXL') THEN PV."option1" 
                    ELSE PV."option2" 
                 END
          FROM "product_variant" PV
                LEFT JOIN "product"P 
                    ON P."id" = PV."product_id"
          GROUP BY 1
          HAVING COUNT(1) > 1
      );

INSERT INTO "data_quality_check"
    (DATA_SOURCE, ENTITY, ERROR_TYPE, DESCRIPTION)
SELECT 'sklad'                                                                      AS DATA_SOURCE
     , 'inventory_item'                                                             AS ENTITY
     , 'duplicities'                                                                AS ERROR_TYPE
     , 'Duplicated Inventory ID:' || PV."inventory_item_id" || ' found in sklad.'   AS DESCRIPTION
FROM "product_variant" PV
    LEFT JOIN "inventory_items" II 
        ON II."id" = PV."inventory_item_id"
    LEFT JOIN "product" P 
        ON P."id" = PV."product_id"
WHERE "inventory_item_id" IN
      (
          SELECT S2."inventory_item_id"
          FROM "product_variant" S2
          GROUP BY S2."inventory_item_id"
          HAVING COUNT(1) > 1
      );
