// TESTS null values in column "country" in table named "TABLE1" 
call TEST_COLUMN_NULL('TABLE1', 'country');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
