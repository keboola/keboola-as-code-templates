CREATE TABLE "bdmOrderLinesEnrich" AS
SELECT
    "bdmOL"."ITEMNAME",
    "bdmOL"."LINE_PURCHASE_PRICE",
    "bdmOL"."ORDER_LINE_AMOUNT",
    "bdmOL"."ORDER_LINE_PRICE_WITHOUT_VAT",
    "bdmOL"."ORDER_DATE",
    "bdmOL"."ORDER_ID",
    "bdmOL"."ORDER_LINE_PRICE_VAT",
    "bdmOL"."ORDER_LINE_PRICE_WITH_VAT",
    "bdmOL"."DISCOUNT_PERCENT",
    "bdmOL"."ORDER_LINE_ID",
    "bdmOL"."ORDER_LINE_PRODUCT_ID",
    "bdmOL"."ORDER_LINE_VAT_RATE",
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
    "bdmP"."PRODUCT_OPTION3"
FROM "bdmOrderLines" "bdmOL"
LEFT JOIN "bdmProducts" "bdmP"
ON "bdmOL"."ORDER_LINE_PRODUCT_ID" = "bdmP"."PRODUCT_ID";

---------------------------------------    
-- přidání sloupce na cenu po slevě, tržeb s daní a bez daně, výpočet marže z cen s DPH, marže bez DPH 
ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "DISCOUNTED_PRICE_WITH_VAT" NUMERIC(38,2);

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "ORDER_REVENUE_WITH_VAT" NUMERIC(38,2);

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "ORDER_PURCHASE_PRICE" NUMERIC(38,2);

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "MARGIN_WITH_VAT" NUMERIC(38,2);

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "DISCOUNTED_PRICE_WITHOUT_VAT" NUMERIC(38,2);

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "ORDER_REVENUE_WITHOUT_VAT" NUMERIC(38,2);

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "MARGIN_WITHOUT_VAT" NUMERIC(38,2);

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "LINE_PURCHASE_PRICE_EMPTY" VARCHAR;

UPDATE "bdmOrderLinesEnrich"
    SET "DISCOUNTED_PRICE_WITH_VAT" = "ORDER_LINE_PRICE_WITH_VAT" * (1 - IFF("DISCOUNT_PERCENT"='' OR "DISCOUNT_PERCENT" >= 100, 0,"DISCOUNT_PERCENT")/100);

UPDATE "bdmOrderLinesEnrich"
    SET "ORDER_REVENUE_WITH_VAT" = "DISCOUNTED_PRICE_WITH_VAT" * "ORDER_LINE_AMOUNT";

UPDATE "bdmOrderLinesEnrich"
    SET "ORDER_PURCHASE_PRICE" = IFF("LINE_PURCHASE_PRICE" = '',0,"LINE_PURCHASE_PRICE") * "ORDER_LINE_AMOUNT";

--když není nákupní cena, co tam dát ?, použila jsem 0 */ 
UPDATE "bdmOrderLinesEnrich"
    SET "MARGIN_WITH_VAT" = "ORDER_REVENUE_WITH_VAT" - "ORDER_PURCHASE_PRICE";

--předpokládám, že purchase_price je bez daně
UPDATE "bdmOrderLinesEnrich"
    SET "DISCOUNTED_PRICE_WITHOUT_VAT" = IFF("ORDER_LINE_PRICE_WITHOUT_VAT" = '',"ORDER_LINE_PRICE_WITH_VAT","ORDER_LINE_PRICE_WITHOUT_VAT")
                                         * (1 - IFF("DISCOUNT_PERCENT"='' OR "DISCOUNT_PERCENT" >= 100, 0,"DISCOUNT_PERCENT")/100);

--když není cena bez daně, použiji cenu s dani    
UPDATE "bdmOrderLinesEnrich"
    SET "ORDER_REVENUE_WITHOUT_VAT" = "DISCOUNTED_PRICE_WITHOUT_VAT" * "ORDER_LINE_AMOUNT";

UPDATE "bdmOrderLinesEnrich"
    SET "MARGIN_WITHOUT_VAT" = "ORDER_REVENUE_WITHOUT_VAT" - "ORDER_PURCHASE_PRICE";

-- marže z jednoho řádku objednávky, když objednány 2 ks, tak za 2 kusy
    
UPDATE "bdmOrderLinesEnrich"
    SET "LINE_PURCHASE_PRICE_EMPTY" = IFF("LINE_PURCHASE_PRICE" = '','purchase price no','purchase price yes');

ALTER TABLE "bdmOrderLinesEnrich" ADD COLUMN "ORDER_STATUS" VARCHAR;

UPDATE "bdmOrderLinesEnrich" ol
    SET ol."ORDER_STATUS" = o."ORDER_STATUS"
FROM "bdmOrders" o
WHERE ol."ORDER_ID" = o."ORDER_ID";
