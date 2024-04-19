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
      CUSTOMER_ID TEXT NOT NULL,
      CUSTOMER_EMAIL_HASH TEXT,
      CUSTOMER_EMAIL TEXT,
      CUSTOMER_BILLING_CITY TEXT,
      CUSTOMER_BILLING_COUNTRY TEXT,
      CUSTOMER_SHIPPING_CITY TEXT,
      CUSTOMER_SHIPPING_COUNTRY TEXT,
      ORDERS_COUNT_TOTAL INTEGER,
      TOTAL_SPEND FLOAT,
      AVG_ORDER_VALUE FLOAT,
      RECENCY_SCORE TEXT,
      DAYS_SINCE_LAST_ORDER INTEGER,
      FREQUENCY_SCORE TEXT,
      ORDERS_COUNT_RFM INTEGER,
      MONETARY_SCORE TEXT,
      SUM_REVENUE FLOAT,
      FINAL_SCORE TEXT,
      SEGMENT TEXT,
      SEGMENT_NR INTEGER,
      FIRST_SUCCEEDED_TRANSACTION_DATE DATE,
      LAST_SUCCEEDED_TRANSACTION_DATE DATE      
);

INSERT INTO  "bdm_customers" 
      SELECT 
            C."id"                                   AS CUSTOMER_ID,
            SHA2(C."email", 224)                     AS CUSTOMER_EMAIL_HASH,
            C."email"                                AS CUSTOMER_EMAIL,
            C."default_address__city"                AS CUSTOMER_BILLING_CITY,
            C."default_address__country"             AS CUSTOMER_BILLING_COUNTRY,
            LS."shipping_address__city"              AS CUSTOMER_SHIPPING_CITY,
            LS."shipping_address__country"           AS CUSTOMER_SHIPPING_COUNTRY,
            C."orders_count"				                 AS ORDERS_COUNT_TOTAL,
            C."total_spent"				                   AS TOTAL_SPEND,
            DIV0(C."total_spent", C."orders_count")  AS AVG_ORDER_VALUE,
            R_SCORE                                  AS RECENCY_SCORE,
            R_RAW                                    AS DAYS_SINCE_LAST_ORDER,
            F_SCORE                                  AS FREQUENCY_SCORE,
            F_RAW                                    AS ORDERS_COUNT_RFM,
            M_SCORE                                  AS MONETARY_SCORE ,
            M_RAW                                    AS SUM_REVENUE,
            FINAL_SCORE                              AS FINAL_SCORE,
            SEGMENT                                  AS SEGMENT,
            SEGMENT_NR                               AS SEGMENT_NR,
            FIRST_SUCCEEDED_TRANSACTION_DATE         AS FIRST_SUCCEDED_TRANSACTION_DATE,
            LAST_SUCCEEDED_TRANSACTION_DATE          AS LAST_SUCCEDED_TRANSACTION_DATE
            
      FROM "customer" C
            LEFT JOIN "last_shipping_address" LS 
                  ON LS."customer_id"=C."id"
            LEFT JOIN "rfm" rfm
                    ON C."id" = rfm.CUSTOMER_ID;

--- try to match customers based on email
CREATE OR REPLACE TABLE "customer_ids" 
AS
      SELECT DISTINCT 
            O."email" AS EMAIL,
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
WHERE O.ORDER_CUSTOMER_EMAIL = C."EMAIL";
