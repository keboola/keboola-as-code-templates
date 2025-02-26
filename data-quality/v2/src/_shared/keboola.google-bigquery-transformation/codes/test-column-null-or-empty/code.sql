/* TESTS null or empty values in column "country" in table named "TABLE1" */
CALL TEST_COLUMN_NULL_OR_EMPTY('TABLE1', 'country')
/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING')
SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */