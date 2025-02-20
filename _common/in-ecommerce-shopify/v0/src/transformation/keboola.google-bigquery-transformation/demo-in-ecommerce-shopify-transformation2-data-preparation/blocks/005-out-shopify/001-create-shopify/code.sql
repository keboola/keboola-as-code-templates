CREATE TABLE `out_shop` AS
SELECT DISTINCT
  CASE
    WHEN UPPER(SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://', 2), '.', 1)) <> ''
    THEN UPPER(SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://', 2), '.', 1))
    WHEN UPPER(SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://www.', 2), '.', 1)) <> ''
    THEN UPPER(SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://www.', 2), '.', 1))
    ELSE UPPER(SPLIT_PART(SPLIT_PART(`order_status_url`, 'www.', 2), '.', 1))
  END AS NAME,
  CASE
    WHEN CONCAT('https://', SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://', 2), '/', 1)) <> ''
    THEN CONCAT('https://', SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://', 2), '/', 1))
    WHEN CONCAT(
      'https://www.',
      SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://www.', 2), '/', 1)
    ) <> ''
    THEN CONCAT(
      'https://www.',
      SPLIT_PART(SPLIT_PART(`order_status_url`, 'https://www.', 2), '/', 1)
    )
    ELSE CONCAT('www.', SPLIT_PART(SPLIT_PART(`order_status_url`, 'www.', 2), '/', 1))
  END AS BASE_URL,
  NULL AS DOMAIN
FROM `order`