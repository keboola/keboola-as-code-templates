/* test that column product doesnt have nulls or empty values in "orders" */
CALL TEST_COLUMN_NULL_OR_EMPTY('orders', 'product');

/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */;