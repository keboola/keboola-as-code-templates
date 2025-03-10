// Tests records in Table 1 that don't have a matching record in Table 2 based on selected columns
call TEST_COLUMN_FOREIGN_REF('TABLE1', 'TABLE2', 'TABLE1_COLUMN', 'TABLE2_COLUMN');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
