// test that column product doesnt have nulls or empty values in "orders"
call TEST_COLUMN_NULL_OR_EMPTY('orders', 'product');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
