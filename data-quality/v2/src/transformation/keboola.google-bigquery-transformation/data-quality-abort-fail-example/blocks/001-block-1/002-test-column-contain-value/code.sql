/* test that product column in table "orders" contains value "Rubber" - fail if not */
CALL TEST_VALUE_CONTAIN('orders', 'product', 'Rubber')
/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING')
SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */