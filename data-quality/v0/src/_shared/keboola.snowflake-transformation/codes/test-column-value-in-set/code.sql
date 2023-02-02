// Tests whether all values in given column in given table are in provided set of values.Fails when value is not in provided set of values.
call TEST_VALUE_IN_SET('TABLE', 'ColumnName', '(\'Proposal\',\'Closed Won\')');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
