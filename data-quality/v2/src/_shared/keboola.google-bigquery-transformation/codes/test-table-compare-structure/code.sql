/* Compares structure (column names and types) of two tables. Fails if different. */
CALL TEST_TABLE_COMPARE_STRUCTURE('TABLE1', 'TABLE2');

/* Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */;