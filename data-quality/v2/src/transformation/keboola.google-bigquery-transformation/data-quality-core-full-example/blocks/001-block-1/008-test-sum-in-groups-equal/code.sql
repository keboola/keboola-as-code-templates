/* Tests whether sum of values in quantity in group by customer_id in orders is equal to provided opposite in "orders" */ /* This example will not match anything */
CALL TEST_SUM_IN_GROUPS_EQUAL('orders', 'price', 'customer_id', 'orders', 'price', 'product');

/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

CREATE OR REPLACE TABLE `orders_new` AS
SELECT
  `customer_id`,
  `quantity` * 1.01 AS `quantityNew`
FROM `orders`;

/* Tests whether sum of values in quantity in group by customer_id in orders is equal to provided opposite in "orders_new" */ /* This example will not match anything */
CALL TEST_SUM_IN_GROUPS_EQUAL('orders', 'price', 'customer_id', 'orders_new', 'quantityNew', 'customer_id');

/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */;