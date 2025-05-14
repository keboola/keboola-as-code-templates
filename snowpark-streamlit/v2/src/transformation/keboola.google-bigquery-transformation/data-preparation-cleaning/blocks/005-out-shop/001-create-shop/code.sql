CREATE TABLE `out_shop` AS
SELECT DISTINCT
  CASE
    WHEN UPPER(SPLIT(SPLIT(order_status_url, 'https://')[OFFSET(1)], '.')[OFFSET(0)]) <> ''
    THEN UPPER(SPLIT(SPLIT(order_status_url, 'https://')[OFFSET(1)], '.')[OFFSET(0)])
    WHEN UPPER(SPLIT(SPLIT(order_status_url, 'https://www.')[OFFSET(1)], '.')[OFFSET(0)]) <> ''
    THEN UPPER(SPLIT(SPLIT(order_status_url, 'https://www.')[OFFSET(1)], '.')[OFFSET(0)])
    ELSE UPPER(SPLIT(SPLIT(order_status_url, 'www.')[OFFSET(1)], '.')[OFFSET(0)])
  END AS NAME,

  CASE
    WHEN CONCAT('https://', SPLIT(SPLIT(order_status_url, 'https://')[OFFSET(1)], '/')[OFFSET(0)]) <> ''
    THEN CONCAT('https://', SPLIT(SPLIT(order_status_url, 'https://')[OFFSET(1)], '/')[OFFSET(0)])
    WHEN CONCAT('https://www.', SPLIT(SPLIT(order_status_url, 'https://www.')[OFFSET(1)], '/')[OFFSET(0)]) <> ''
    THEN CONCAT('https://www.', SPLIT(SPLIT(order_status_url, 'https://www.')[OFFSET(1)], '/')[OFFSET(0)])
    ELSE CONCAT('www.', SPLIT(SPLIT(order_status_url, 'www.')[OFFSET(1)], '/')[OFFSET(0)])
  END AS BASE_URL,
  NULL AS DOMAIN
FROM `order`;