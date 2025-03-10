// test that product column in table "orders" contains value "Rubber" - fail if not
call TEST_VALUE_CONTAIN('orders', 'product', 'Rubber');

// Store results in table DQ_RESULTS_LOG [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
