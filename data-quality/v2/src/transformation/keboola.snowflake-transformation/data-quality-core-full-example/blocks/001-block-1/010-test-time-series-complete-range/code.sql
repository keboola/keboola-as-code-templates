// Tests if there is at least one record for each date in date between 2021-01-01 and 2021-01-31 in table "orders"
call TEST_TIME_SERIES_COMPLETE_RANGE('orders', 'date', '1', '2021-01-01'::date, '2021-01-31'::date);

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
