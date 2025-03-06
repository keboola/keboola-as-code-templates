/* Tests whether product in "orders" ends with 'Hat'. Fails if yes. */
CALL TEST_VALUE_NOT_END('orders', 'product', 'Hat');

/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */;