/* test if table "orders" in column customer_id has a reference in table 'customers' for column pk for each row */
CALL TEST_COLUMN_FOREIGN_REF('orders', 'customers', 'order_id', 'pk')
/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING')
/* test if table "orders" in column customer_id has a reference in table 'customers' for column Name for each row - this should fail.. */
CALL TEST_COLUMN_FOREIGN_REF('orders', 'customers', 'order_id', 'name')
/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING')
SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */