CREATE TABLE  "bdm_product_margin_over_time" 
AS
     SELECT ORDER_DATE::date                                                         AS ORDER_DATE
          , ORDER_LINE_PRODUCT_ID                                                    AS PRODUCT_ID
          , AVG((ORDER_LINE_PRICE_WITH_VAT - LINE_PURCHASE_PRICE)/ORDER_LINE_AMOUNT) AS AVG_ORDER_LINE_MARGIN
     FROM "bdm_order_lines"
     WHERE ORDER_LINE_PRICE_WITH_VAT - LINE_PURCHASE_PRICE <> 0
     GROUP BY 1,2
     ORDER BY ORDER_DATE, PRODUCT_ID
;
