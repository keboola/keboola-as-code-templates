--calculate last billing address from orders table, it is used as an address in the cusotmers table, in another table the address is not present
CREATE OR REPLACE TABLE "last_billing_address" 
AS
      WITH "last_order" 
            AS
                  (
                  SELECT "customer_id", max("id") AS "id"
                  FROM "orders"
                  GROUP BY 1
                  )
      SELECT 
            "billing_address_city", 
            "billing_address_country", 
            O."customer_id"
      FROM "orders" O 
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

--count orders_count a total_spend for each customer
CREATE OR REPLACE TABLE "tmp_customer_order_count_value"
AS
(
    SELECT "customer_id" AS CUSTOMER_ID, 
            COUNT (DISTINCT "id") AS ORDERS_COUNT,
            SUM("total_inc_tax") AS TOTAL_SPEND     
    FROM "orders"
    GROUP BY 1);

--insert into tmp table 
CREATE OR REPLACE TABLE "tmp_customers"
AS
    (SELECT
    
          "id"                                          AS CUSTOMER_ID,
          SHA2("email", 224)                            AS CUSTOMER_EMAIL_HASH,
          "email"                                       AS CUSTOMER_EMAIL,
          lba."billing_address_city"   	                AS CUSTOMER_BILLING_CITY,
          lba."billing_address_country"	                AS CUSTOMER_BILLING_COUNTRY,
          ''::STRING     	                              AS CUSTOMER_SHIPPING_CITY, 
          ''::STRING   	                                AS CUSTOMER_SHIPPING_COUNTRY, 
          ifnull(tmpco.ORDERS_COUNT,0)                  AS ORDERS_COUNT_TOTAL, 
          ifnull(tmpco.TOTAL_SPEND,0)                   AS TOTAL_SPEND,
          DIV0(tmpco.TOTAL_SPEND, tmpco.ORDERS_COUNT)   AS AVG_ORDER_VALUE,    

    FROM "customers" C
        LEFT JOIN "tmp_customer_order_count_value" tmpco
            ON C."id" = tmpco."CUSTOMER_ID"
        LEFT JOIN  "last_billing_address" lba
            ON C."id" = lba."customer_id");

INSERT INTO "bdm_customers"
    SELECT 	tmpc.CUSTOMER_ID,
    				tmpc.CUSTOMER_EMAIL_HASH,
            tmpc.CUSTOMER_EMAIL,
            tmpc.CUSTOMER_BILLING_CITY,
            tmpc.CUSTOMER_BILLING_COUNTRY,
            tmpc.CUSTOMER_SHIPPING_CITY, 
            tmpc.CUSTOMER_SHIPPING_COUNTRY,
            tmpc.ORDERS_COUNT_TOTAL, 
            tmpc.TOTAL_SPEND,
            tmpc.AVG_ORDER_VALUE,
            R_SCORE                                	AS RECENCY_SCORE,
            R_RAW                                   AS DAYS_SINCE_LAST_ORDER,
            F_SCORE                                 AS FREQUENCY_SCORE,
            F_RAW                                   AS ORDERS_COUNT_RFM,
            M_SCORE                                 AS MONETARY_SCORE,
            M_RAW                                   AS SUM_REVENUE,
            FINAL_SCORE                             AS FINAL_SCORE,
            SEGMENT                                 AS SEGMENT,
            SEGMENT_NR                              AS SEGMENT_NR,
            FIRST_SUCCEEDED_TRANSACTION_DATE        AS FIRST_SUCCEDED_TRANSACTION_DATE,
            LAST_SUCCEEDED_TRANSACTION_DATE         AS LAST_SUCCEDED_TRANSACTION_DATE
    FROM  "tmp_customers" tmpc
    LEFT JOIN "rfm" rfm
        ON tmpc.CUSTOMER_ID = rfm.CUSTOMER_ID;

--- try to match customers based on email 
CREATE OR REPLACE TABLE "customer_ids" 
AS
      SELECT DISTINCT 
            O."billing_address_email" AS EMAIL,
            C.CUSTOMER_ID
      FROM "orders" O
            JOIN "bdm_customers" C
                  ON O."billing_address_email" = C.CUSTOMER_EMAIL
      QUALIFY ROW_NUMBER() OVER (PARTITION BY "billing_address_email" ORDER BY C.CUSTOMER_ID) = 1
;

-- UPDATE ORDERS
UPDATE "bdm_orders" O
SET O.CUSTOMER_ID = C.CUSTOMER_ID
FROM "customer_ids" C
WHERE O.ORDER_CUSTOMER_EMAIL = C."EMAIL";
