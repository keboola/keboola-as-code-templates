CREATE TABLE `bdmOrderLinesMargin` AS
SELECT
  `ORDER_LINE_PRODUCT_ID`,
  SUM(`ORDER_LINE_AMOUNT`) AS `ORDERED_AMOUNT`,
  SUM(`MARGIN_WITHOUT_VAT`) AS `TOTAL_PRODUCT_MARGIN`,
  SUM(`MARGIN_WITHOUT_VAT`) / SUM(`ORDER_LINE_AMOUNT`) AS `UNIT_PRODUCT_MARGIN`
FROM `bdmOrderLinesEnrich`
GROUP BY
  `ORDER_LINE_PRODUCT_ID`;