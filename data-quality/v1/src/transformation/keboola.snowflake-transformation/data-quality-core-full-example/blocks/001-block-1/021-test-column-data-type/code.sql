//  Tests data type of provided column in provided table. Fails when different than expected.
call TEST_COLUMN_DATA_TYPE('orders', 'product', 'TEXT');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
