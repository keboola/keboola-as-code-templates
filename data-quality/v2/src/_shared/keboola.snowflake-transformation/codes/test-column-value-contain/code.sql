// Tests records in Table 1 that contain string 'republic' in column country
call TEST_VALUE_CONTAIN('TABLE1', 'country', 'republic');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
