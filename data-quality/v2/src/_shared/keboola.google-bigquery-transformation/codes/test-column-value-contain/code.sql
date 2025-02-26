/* Tests records in Table 1 that contain string 'republic' in column country */
CALL TEST_VALUE_CONTAIN('TABLE1', 'country', 'republic');

/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */;