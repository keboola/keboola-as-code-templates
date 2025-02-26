/* test that column product in table "orders" doesn't contain value Rubber */
CALL TEST_VALUE_NOT_CONTAIN('orders', 'product', 'Rubber');

/* Store results in table DQ_RESULTS_LOG[WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */;