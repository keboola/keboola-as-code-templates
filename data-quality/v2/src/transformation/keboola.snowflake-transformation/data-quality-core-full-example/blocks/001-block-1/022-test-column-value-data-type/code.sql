//  Tests data type of values in provided column in provided table. It tests actual data - not the metadata type set for the table. Fails when different than expected. 
call TEST_COLUMN_VALUE_DATA_TYPE('orders', 'price', 'DATE');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
