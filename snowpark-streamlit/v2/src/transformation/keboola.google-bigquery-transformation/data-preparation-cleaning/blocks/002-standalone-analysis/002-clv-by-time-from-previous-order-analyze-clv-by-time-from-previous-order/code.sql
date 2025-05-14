CREATE OR REPLACE TABLE `analyze_clv_by_time_from_previous_order` AS
WITH 
diff_count AS (
	SELECT o.ORDER_ID,
		DATE_DIFF(
	      CAST(TIMESTAMP(O.ORDER_DATE) AS DATE),
	      LAG(CAST(TIMESTAMP(O.ORDER_DATE) AS DATE)) OVER (PARTITION BY o.ORDER_CUSTOMER_EMAIL ORDER BY CAST(TIMESTAMP(O.ORDER_DATE) AS DATE)),
	      DAY
	    ) AS DIFF,
 	(
      SELECT
        COUNT(1)
      FROM `bdm_orders` AS io
      WHERE
        io.ORDER_CUSTOMER_EMAIL = o.ORDER_CUSTOMER_EMAIL
    ) AS ORDER_COUNT,
    	ORDER_CUSTOMER_EMAIL,
    	ORDER_TOTAL_PRICE_WITH_TAXES AS ORDER_TOTAL_PRICE_TAXES
    FROM `bdm_orders` AS o
  	WHERE
    	ORDER_CUSTOMER_EMAIL <> ''
),
previous_order_category AS (
  SELECT
    ORDER_ID,
    DIFF,
    CASE
      WHEN DIFF > 90
      THEN '110_Q+ since previous order'
      WHEN DIFF > 60
      THEN '100_2M-Q since previous order'
      WHEN DIFF > 30
      THEN '090_1M-2M since previous order'
      WHEN DIFF > 7
      THEN '080_7D-1M since previous order'
      WHEN DIFF > 6
      THEN '070_7D since previous order'
      WHEN DIFF > 5
      THEN '060_6D since previous order'
      WHEN DIFF > 4
      THEN '050_5D since previous order'
      WHEN DIFF > 3
      THEN '040_4D since previous order'
      WHEN DIFF > 2
      THEN '030_3D since previous order'
      WHEN DIFF > 1
      THEN '020_2D since previous order'
      WHEN DIFF > 0
      THEN '010_1D since previous order'
      ELSE 'N/A'
    END AS PREVIOUS_ORDER,
    ORDER_COUNT,
    ORDER_CUSTOMER_EMAIL,
    ORDER_TOTAL_PRICE_TAXES
  FROM diff_count
  WHERE
    ORDER_CUSTOMER_EMAIL <> ''
)
SELECT
  PREVIOUS_ORDER AS TIME_FROM_PREVIOUS_ORDER,
  COUNT(1) AS ORDERS,
  COUNT(DISTINCT ORDER_CUSTOMER_EMAIL) AS UNIQUE_CUSTOMERS,
  SUM(CAST(ORDER_TOTAL_PRICE_TAXES AS FLOAT64)) / COUNT(DISTINCT ORDER_CUSTOMER_EMAIL) AS AVG_CLV,
  SUM(CAST(ORDER_TOTAL_PRICE_TAXES AS FLOAT64)) AS ORDER_TOTAL_PRICE_TAXES,
  AVG(CAST(ORDER_TOTAL_PRICE_TAXES AS FLOAT64)) AS AVG_ORDER_PRICE
FROM previous_order_category
GROUP BY
  TIME_FROM_PREVIOUS_ORDER
ORDER BY
  PREVIOUS_ORDER NULLS LAST;