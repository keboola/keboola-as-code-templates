-- rozpeti objednavek 2
CREATE TABLE "analyze_clv_by_order_count" AS
WITH PREVIOUS_ORDER_CATEGORY AS (
    SELECT O.ORDER_ID,
           DATEDIFF(DAY,
                    LAG(O.ORDER_DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL ORDER BY O.ORDER_DATE),
                    O.ORDER_DATE)                                        AS DIFF,
           CASE
               WHEN DIFF > 90 THEN '110_Q+ since previous order'
               WHEN DIFF > 60 THEN '100_2M-Q since previous order'
               WHEN DIFF > 30 THEN '090_1M-2M since previous order'
               WHEN DIFF > 7 THEN '080_7D-1M since previous order'
               WHEN DIFF > 6 THEN '070_7D since previous order'
               WHEN DIFF > 5 THEN '060_6D since previous order'
               WHEN DIFF > 4 THEN '050_5D since previous order'
               WHEN DIFF > 3 THEN '040_4D since previous order'
               WHEN DIFF > 2 THEN '030_3D since previous order'
               WHEN DIFF > 1 THEN '020_2D since previous order'
               WHEN DIFF > 0 THEN '010_1D since previous order'
               ELSE 'N/A'
            END                                                          AS PREVIOUS_ORDER,
           (SELECT COUNT(1) FROM "bdm_orders" IO WHERE IO.ORDER_CUSTOMER_EMAIL = O.ORDER_CUSTOMER_EMAIL) AS ORDER_COUNT,
           ORDER_CUSTOMER_EMAIL,
           ORDER_TOTAL_PRICE_VAT
    FROM "bdm_orders" O
    WHERE ORDER_CUSTOMER_EMAIL <> '')

SELECT CASE
           WHEN ORDER_COUNT >= 14 THEN '07   15+ total orders'
           WHEN ORDER_COUNT > 9 THEN '06 10-14 total orders'
           WHEN ORDER_COUNT > 5 THEN '05   6-9 total orders'
           WHEN ORDER_COUNT > 3 THEN '04   4-5 total orders'
           WHEN ORDER_COUNT = 3 THEN '03     3 total orders'
           WHEN ORDER_COUNT = 2 THEN '02     2 total orders'
           ELSE '01     1 order only' 
        END                                                              AS CUSTOMER_CATEGORY_BY_ORDER_COUNT
     , COUNT(1)                                                          AS ORDERS
     , COUNT(DISTINCT ORDER_CUSTOMER_EMAIL)                              AS UNIQUE_CUTOMERS
     , SUM(ORDER_TOTAL_PRICE_VAT) / COUNT(DISTINCT ORDER_CUSTOMER_EMAIL) AS AVG_CLV
     , SUM(ORDER_TOTAL_PRICE_VAT)                                        AS ORDER_TOTAL_PRICE_VAT
     , AVG(ORDER_TOTAL_PRICE_VAT)                                        AS AVG_ORDER_PRICE
FROM PREVIOUS_ORDER_CATEGORY
GROUP BY CUSTOMER_CATEGORY_BY_ORDER_COUNT
ORDER BY CUSTOMER_CATEGORY_BY_ORDER_COUNT
;
