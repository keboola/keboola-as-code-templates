// TESTS if there are at least 10 records for each date in last 730 days for date_column value
call TEST_TIME_SERIES_COMPLETE('TABLE1', 'date_column', '10');

// Store results in table DQ_RESULTS_LOG
call LOG_PREVIOUS_TEST_RESULT('FAIL');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
