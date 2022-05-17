--LEFT join tabulky Products a tabulky "bdm.OrderLinesMargin" 
CREATE TABLE "bdmProductsEnrich" AS
    SELECT 
            "bdmP"."PRODUCT_CODE_2",
            "bdmP"."PRODUCT_URL",	
            "bdmP"."PRODUCT_MANUFACTURER",	
            "bdmP"."PRODUCT_OPTION2",	
            "bdmP"."PRODUCT_EAN",	
            "bdmP"."PRODUCT_NAME",	
            "bdmP"."CATEGORY_TEXT",	
            "bdmP"."CATEGORY",
            "bdmP"."PRODUCT_CODE",
            "bdmP"."PRODUCT_PURCHASE_PRICE",
            "bdmP"."PRODUCT_STANDARD_PRICE",
            "bdmP"."IS_DELETED",
            "bdmP"."PRODUCT_GUID",
            "bdmP"."PRODUCT_OPTION1",	
            "bdmP"."PRODUCT_PRICE",
            "bdmP"."PRODUCT_TYPE",
            "bdmP"."PRODUCT_STOCK_AMOUNT",
            "bdmP"."PRODUCT_ID",
            "bdmP"."PRODUCT_OPTION3",
            "bdmOLM"."ORDER_LINE_PRODUCT_ID",
            "bdmOLM"."ORDERED_AMOUNT",
            "bdmOLM"."TOTAL_PRODUCT_MARGIN",
            "bdmOLM"."UNIT_PRODUCT_MARGIN"
    FROM "bdmProducts" "bdmP"
    LEFT JOIN "bdmOrderLinesMargin" "bdmOLM"
    ON "bdmP"."PRODUCT_ID" = "bdmOLM"."ORDER_LINE_PRODUCT_ID"
    ORDER BY "bdmP"."PRODUCT_ID" DESC;
