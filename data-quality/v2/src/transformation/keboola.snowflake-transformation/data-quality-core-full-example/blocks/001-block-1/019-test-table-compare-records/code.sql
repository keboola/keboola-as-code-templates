CREATE OR REPLACE TABLE "orders_deleted" AS
SELECT *
FROM "orders"
WHERE "product" = 'Rubber';

// Compares records of 2 tables. Fails if different.
call TEST_TABLE_COMPARE_RECORDS('orders', 'orders');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Compares records of 2 tables. Fails if different.
call TEST_TABLE_COMPARE_RECORDS('orders', 'orders_deleted');

// Store results in table DQ_RESULTS_LOG.  [WARNING/FAIL]
call LOG_PREVIOUS_TEST_RESULT('WARNING');

// Abort if any FAIL runs
SET ABORT_TRANSFORMATION = (SELECT GET_LATEST_FAILED_MESSAGE());
