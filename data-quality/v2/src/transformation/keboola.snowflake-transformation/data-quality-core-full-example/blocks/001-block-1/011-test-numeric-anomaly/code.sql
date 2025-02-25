// Tests TABLE1_IDs for which value in TABLE1_COLUMN can be considered an anomaly
call TEST_ANOMALY_NUMERIC('orders', 'price', 'order_id');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
