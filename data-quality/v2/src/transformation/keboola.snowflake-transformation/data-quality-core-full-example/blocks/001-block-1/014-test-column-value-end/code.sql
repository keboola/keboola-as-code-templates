// Tests whether product in "orders" ends with 'Hat'. Fails if not.
call TEST_VALUE_END('orders', 'product', 'Hat');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
