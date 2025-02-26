/* TESTS if there are at least 5 records for each date in last 730 days for date column value */
CALL TEST_TIME_SERIES_COMPLETE('orders', 'date', '5')
/* Store results in table DQ_RESULTS_LOG[WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING')
SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */