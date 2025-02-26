/* Tests TABLE1_IDs for which value in TABLE1_COLUMN can be considered an anomaly */
CALL TEST_ANOMALY_NUMERIC('orders', 'price', 'order_id')
/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING')
SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */