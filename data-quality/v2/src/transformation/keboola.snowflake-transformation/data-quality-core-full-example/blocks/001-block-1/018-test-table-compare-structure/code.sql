// Compares structure (column names and types) of two tables. Fails if different.
call TEST_TABLE_COMPARE_STRUCTURE('orders', 'customers');

// Store results in table DQ_RESULTS_LOG. [WARNING/FAIL] 
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Compares structure (column names and types) of two tables. Fails if different.
call TEST_TABLE_COMPARE_STRUCTURE('orders', 'orders');

// Store results in table DQ_RESULTS_LOG. [WARNING/FAIL] 
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
