CREATE TABLE "bdmOrdersEnrich" AS
SELECT  
        "bdmO"."ORDER_TOTAL_PRICE_WITH_WAT",
        "bdmO"."REFERER",
        "bdmO"."SOURCE",
        "bdmO"."ORDER_ID",
        "bdmO"."BILLING_TYPE",
        "bdmO"."ORDER_DATE",
        "bdmO"."ORDER_STATUS",
        "bdmO"."ORDER_PACKAGE_NUMBER",
        "bdmO"."CHANNEL",
        "bdmO"."BILLING_CITY",	
        "bdmO"."BILLING_ZIP",
        "bdmO"."ORDER_TOTAL_PRICE_WITHOUT_WAT",
        "bdmO"."SHIPPING_COUNTRY",
        "bdmO"."DAYS_SINCE_PREVIOUS_ORDER",
        "bdmO"."IS_FIRST_PURCHASE",
        "bdmO"."ORDER_CURRENCY",
        "bdmO"."ORDER_CUSTOMER_EMAIL",
        "bdmO"."CUSTOMER_REGULARITY_TYPE",
        "bdmO"."IS_SUCESSFUL",
        "bdmO"."ORDER_REMARK",
        "bdmO"."BILLING_COUNTRY",
        "bdmO"."CUSTOMER_ID",
        "bdmO"."ORDER_TOTAL_PRICE_VAT",
        "bdmO"."ORDER_WEIGHT",
        "bdmO"."SHIPPING_CITY",
        "bdmO"."SHIPPING_TYPE",
        "bdmO"."SHIPPING_ZIP",
        (SELECT SUM("MARGIN_WITH_VAT")
         FROM "bdmOrderLinesEnrich" "bdmOLE"
         WHERE "bdmO"."ORDER_ID" = "bdmOLE"."ORDER_ID") "ORDER_MARGIN_WITH_VAT"
FROM
    "bdmOrders" "bdmO";
