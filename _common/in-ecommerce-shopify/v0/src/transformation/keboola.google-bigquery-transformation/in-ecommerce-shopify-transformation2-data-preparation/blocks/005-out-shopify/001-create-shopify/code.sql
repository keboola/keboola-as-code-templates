CREATE TABLE `out_shop` (
  NAME STRING(255),
  BASE_URL STRING(1024),
  DOMAIN STRING(255)
);

INSERT INTO `out_shop`
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
FROM `order`;