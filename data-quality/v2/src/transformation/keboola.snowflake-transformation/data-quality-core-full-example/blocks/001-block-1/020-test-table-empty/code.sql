// Tests if table is empty. Fails if empty.
call TEST_TABLE_EMPTY('orders');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
