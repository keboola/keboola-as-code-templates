// test that column product in table "orders" doesn't contain value Rubber
call TEST_VALUE_NOT_CONTAIN('orders', 'product', 'Rubber');

// Store results in table DQ_RESULTS_LOG[WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
