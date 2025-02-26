/* Tests whether sum of values in Table1_Column in group by column Table1_group_column in Table 1 is equal to provided opposite in Table 2 */
CALL TEST_SUM_IN_GROUPS_EQUAL('TABLE1', 'TABLE1_COLUMN', 'TABLE1_GROUP_COLUMN', 'TABLE2', 'TABLE2_COLUMN', 'TABLE2_GROUP_COLUMN');

/* Store results in table DQ_RESULTS_LOG [WARNING/FAIL] */
CALL LOG_PREVIOUS_TEST_RESULT('WARNING');

SET ABORT_TRANSFORMATION = (
  SELECT
    GET_LATEST_FAILED_MESSAGE()
) /* Abort if any FAIL runs */;