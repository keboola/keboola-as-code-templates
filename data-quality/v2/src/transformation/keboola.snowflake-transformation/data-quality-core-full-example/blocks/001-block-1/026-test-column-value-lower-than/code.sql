// Tests that each value in given column in given table is lower than provided value. Fails when value is NOT lower than the provided value.
call TEST_VALUE_LOWER_THAN('orders', 'price', '1000');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
