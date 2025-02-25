// TESTS unique values in column "order_id" in table named "orders" 
call TEST_COLUMN_UNIQUE('orders', 'order_id');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
