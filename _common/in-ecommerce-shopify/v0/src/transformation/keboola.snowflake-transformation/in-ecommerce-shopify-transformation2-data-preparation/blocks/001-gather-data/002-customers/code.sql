CREATE OR REPLACE TABLE "last_shipping_address" 
AS
      WITH "last_order" 
            AS
                  (
                  SELECT "customer_id", max("id") AS "id"
                  FROM "order"
                  GROUP BY 1
                  )
      SELECT 
            "shipping_address__city", 
            "shipping_address__country", 
            O."customer_id"
      FROM "order" O 
            JOIN "last_order" LO 
                  ON LO."id" = O."id";

--BDM_CUSTOMERS
CREATE TABLE "bdm_customers"
(
      CUSTOMER_ID VARCHAR(255),
      CUSTOMER_EMAIL_HASH VARCHAR(255),
      CUSTOMER_EMAIL VARCHAR(255),
      CUSTOMER_ACCOUNT_GUID VARCHAR(255) NOT NULL,
      CUSTOMER_BILLING_CITY VARCHAR(255),
      CUSTOMER_BILLING_COUNTRY VARCHAR(255),
      CUSTOMER_SHIPPING_CITY VARCHAR(255),
      CUSTOMER_SHIPPING_COUNTRY VARCHAR(255),
      CUSTOMER_PRICE_LIST VARCHAR(255),
      CUSTOMER_GROUP VARCHAR(255),
      ORDERS_COUNT INTEGER,
      TOTAL_SPEND FLOAT,
      VERIFIED_EMAIL BOOLEAN,
      STATE VARCHAR(255)
);

INSERT INTO "bdm_customers" 
      SELECT 
            C."id"                              AS CUSTOMER_ID,
            SHA2(C."email", 224)                AS CUSTOMER_EMAIL_HASH,
            C."email"                           AS CUSTOMER_EMAIL,
            C."id"                              AS CUSTOMER_ACCOUNT_GUID,
            C."default_address__city"           AS CUSTOMER_BILLING_CITY,
            C."default_address__country"        AS CUSTOMER_BILLING_COUNTRY,
            LS."shipping_address__city"         AS CUSTOMER_SHIPPING_CITY,
            LS."shipping_address__country"      AS CUSTOMER_SHIPPING_COUNTRY,
            ''::STRING                          AS CUSTOMER_PRICE_LIST,
            ''::STRING                          AS CUSTOMER_GROUP,
            nullif(C."orders_count",'')					AS ORDERS_COUNT,
            nullif(C."total_spent",'')						AS TOTAL_SPEND,
            C."verified_email"									AS VERIFIED_EMAIL,
            C."state"														AS STATE
      FROM "customer" C
            LEFT JOIN "last_shipping_address" LS 
                  ON LS."customer_id"=C."id";

--- try to match customers based on email
CREATE OR REPLACE TABLE "customer_ids" 
AS
      SELECT DISTINCT 
            O."email",
            C.CUSTOMER_ID
      FROM "order" O
            JOIN "bdm_customers" C
                  ON O."email" = C.CUSTOMER_EMAIL
      QUALIFY ROW_NUMBER() OVER (PARTITION BY "email" ORDER BY C.CUSTOMER_ID) = 1
;

-- UPDATE ORDERS
UPDATE "bdm_orders" O
SET O.CUSTOMER_ID = C.CUSTOMER_ID
FROM "customer_ids" C
WHERE O.ORDER_CUSTOMER_EMAIL = C."email";

CREATE TABLE "order_customer_categories" 
AS
      SELECT 
            O.ORDER_ID,
            MIN(O.ORDER_DATE::DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL)                                                 AS FIRST_ORDER_DATE,
            MAX(O.ORDER_DATE::DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL)                                                 AS LAST_ORDER_DATE,
            DATEDIFF(DAY, FIRST_ORDER_DATE, O.ORDER_DATE::DATE)                                                                AS DAYS_SINCE_FIRST_ORDER,
            DATEDIFF(DAY, LAG(O.ORDER_DATE) OVER (PARTITION BY O.ORDER_CUSTOMER_EMAIL ORDER BY O.ORDER_DATE),O.ORDER_DATE)     AS DIFF,
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
            END                                                                                                                AS PREVIOUS_ORDER,
            (SELECT COUNT(1)
            FROM "bdm_orders" IO
            WHERE IO.ORDER_CUSTOMER_EMAIL = O.ORDER_CUSTOMER_EMAIL)                                                            AS ORDER_COUNT,
            COUNT(*)
                  OVER (PARTITION BY ORDER_CUSTOMER_EMAIL ORDER BY ORDER_DATE::DATE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS ORDER_COUNT_ROLL,
            SUM(ORDER_TOTAL_PRICE_WITHOUT_TAXES)
                  OVER (PARTITION BY ORDER_CUSTOMER_EMAIL ORDER BY ORDER_DATE::DATE ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)   AS ORDER_PRICE_ROLL,
            CASE
                  WHEN ORDER_COUNT_ROLL >= 14 THEN '15+ total orders'
                  WHEN ORDER_COUNT_ROLL > 9 THEN '10-14 total orders'
                  WHEN ORDER_COUNT_ROLL > 5 THEN '6-9 total orders'
                  WHEN ORDER_COUNT_ROLL > 3 THEN '4-5 total orders'
                  WHEN ORDER_COUNT_ROLL = 3 THEN '3 total orders'
                  WHEN ORDER_COUNT_ROLL = 2 THEN '2 total orders'
                  WHEN ORDER_COUNT_ROLL = 1 THEN 'New Customer'
                  ELSE 'new_customer' 
            END                                                                                                                AS CATEGORY_BY_ORDER_COUNT,
            ORDER_CUSTOMER_EMAIL,
            ORDER_TOTAL_PRICE_TAXES
FROM "bdm_orders" O
WHERE ORDER_CUSTOMER_EMAIL <> ''
ORDER BY ORDER_CUSTOMER_EMAIL, ORDER_DATE;

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