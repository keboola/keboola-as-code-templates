//  Tests whether value in given column in given table is equal with provided string. Fails if not equal.
call TEST_VALUE_EQUAL('TABLE', 'ColumnName', 'TEXT');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
