--BDM_CUSTOMERS
CREATE TABLE "bdm_customers" AS
SELECT C."accountGuid"      AS CUSTOMER_ID
     , SHA2(C."email", 224) AS CUSTOMER_EMAIL_HASH
     , C."email"            AS CUSTOMER_EMAIL
     , C."accountGuid"      AS CUSTOMER_ACCOUNT_GUID
     , C."billingCity"      AS CUSTOMER_BILLING_CITY
     , C."billingCountry"   AS CUSTOMER_BILLING_COUNTRY
     , C."shippingCity"     AS CUSTOMER_SHIPPING_CITY
     , C."shippingCountry"  AS CUSTOMER_SHIPPING_COUNTRY
     , C."pricelistName"    AS CUSTOMER_PRICE_LIST
     , C."customerGroup"    AS CUSTOMER_GROUP
FROM "customers" C;

--- try to match customars based on email
CREATE TABLE "customer_ids" AS
SELECT DISTINCT O."email"
              , C.CUSTOMER_ID
FROM "orders" O
         JOIN "bdm_customers" C
              ON O."email" = C.CUSTOMER_EMAIL
    QUALIFY ROW_NUMBER() OVER (PARTITION BY "email" ORDER BY C.CUSTOMER_ID) = 1
;

-- UPDATE ORDERS

UPDATE "bdm_orders" O
SET O.CUSTOMER_ID = C.CUSTOMER_ID
FROM "customer_ids" C
WHERE O.ORDER_CUSTOMER_EMAIL = C."email";

CREATE TABLE "order_customer_categories" AS
SELECT O.ORDER_ID
     , MIN(O.ORDER_DATE::DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL)                                                        AS FIRST_ORDER_DATE
     , MAX(O.ORDER_DATE::DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL)                                                        AS LAST_ORDER_DATE
     , DATEDIFF(DAY, FIRST_ORDER_DATE, O.ORDER_DATE::DATE)                                                                       AS DAYS_SINCE_FIRST_ORDER

     , DATEDIFF(DAY,
                LAG(O.ORDER_DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL ORDER BY O.ORDER_DATE),
                O.ORDER_DATE
    )                                                                                                                            AS DIFF
     , CASE
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
    END                                                                                                                          AS PREVIOUS_ORDER
     , (SELECT COUNT(1)
        FROM "bdm_orders" IO
        WHERE IO.ORDER_CUSTOMER_EMAIL = O.ORDER_CUSTOMER_EMAIL)                                                                  AS ORDER_COUNT
     , COUNT(*)
             OVER (PARTITION BY ORDER_CUSTOMER_EMAIL ORDER BY ORDER_DATE::DATE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ORDER_COUNT_ROLL
     , SUM(ORDER_TOTAL_PRICE_WITHOUT_WAT)
           OVER (PARTITION BY ORDER_CUSTOMER_EMAIL ORDER BY ORDER_DATE::DATE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)   AS ORDER_PRICE_ROLL
     , CASE
           WHEN ORDER_COUNT_ROLL >= 14 THEN '15+ total orders'
           WHEN ORDER_COUNT_ROLL > 9 THEN '10-14 total orders'
           WHEN ORDER_COUNT_ROLL > 5 THEN '6-9 total orders'
           WHEN ORDER_COUNT_ROLL > 3 THEN '4-5 total orders'
           WHEN ORDER_COUNT_ROLL = 3 THEN '3 total orders'
           WHEN ORDER_COUNT_ROLL = 2 THEN '2 total orders'
           WHEN ORDER_COUNT_ROLL = 1 THEN 'New Customer'
           ELSE 'new_customer' END                                                                                               AS CATEGORY_BY_ORDER_COUNT
     , ORDER_CUSTOMER_EMAIL
     , ORDER_TOTAL_PRICE_VAT
FROM "bdm_orders" O
WHERE ORDER_CUSTOMER_EMAIL <> ''
ORDER BY ORDER_CUSTOMER_EMAIL, ORDER_DATE
;

UPDATE "order_customer_categories"
SET DIFF=0
WHERE DIFF IS NULL;

--- UPDATE CUSTOMER CATEGORIES AT THE TIME OF TRANSACTION
UPDATE "bdm_orders" O
SET O.CUSTOMER_REGULARITY_TYPE = C.CATEGORY_BY_ORDER_COUNT
FROM "order_customer_categories" C
WHERE O.ORDER_ID = C.ORDER_ID;

UPDATE "bdm_orders" O
SET O.DAYS_SINCE_PREVIOUS_ORDER = C.DIFF
FROM "order_customer_categories" C
WHERE O.ORDER_ID = C.ORDER_ID;

UPDATE "bdm_orders" O
SET O.IS_FIRST_PURCHASE = TRUE
FROM "order_customer_categories" C
WHERE O.ORDER_ID = C.ORDER_ID
  AND C.ORDER_COUNT_ROLL = 1;
