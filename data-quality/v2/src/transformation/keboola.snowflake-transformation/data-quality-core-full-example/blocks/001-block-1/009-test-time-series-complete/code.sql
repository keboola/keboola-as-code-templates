// TESTS if there are at least 5 records for each date in last 730 days for date column value
call TEST_TIME_SERIES_COMPLETE('orders', 'date', '5');

// Store results in table DQ_RESULTS_LOG[WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
