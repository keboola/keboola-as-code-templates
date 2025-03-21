SET map_bucket = 'out.c-TESTDATA' /* Template - Custom ETL Parameters for Keboola Snowflake Transformations */ /* Parameter:   map_bucket */ /* Mandatory:   Yes */ /* Description: Storage bucket of Target table */ /* Example1:    SET map_bucket = 'out.c-RPDM'; */;

SET map_target_table = 'RPDM_SALES_PHASES_MRG' /* Parameter:   map_target_table */ /* Mandatory:   Yes */ /* Description: Target table name */ /* Example1:    SET map_module_id = 'RPDM_SALES_PHASES';  */;

SET map_module_id = 'CURRACC' /* Parameter:   map_module_id */ /* Mandatory:   Yes */ /* Description: Transformation identifier , contains constant value for every transformation, could be used also for DELETE operation filter */ /* Example1:    SET map_module_id = 'MAIN';  -- Usual value if there is only 1 transformation to Target Table */ /* Example2:    SET map_module_id = 'UNSEC'; -- User value if there is more transformations to Target Table */;

SET map_pk = 'RPSP_SOURCE_ID' /* Parameter:   map_pk */ /* Mandatory:   Yes */ /* Description: Target table column(s) of primary key used in particular transformation */ /* Example1:    SET map_pk = 'RPSP_SOURCE_ID,RPSP_TYPE'; */;

SET map_seq_col = '' /* Parameter:   map_seq_col> */ /* Mandatory:   No */ /* Description: Technical key column (only one) filled by sequence */ /* Note:        Implemented only in MERGE stereotype */ /* Example:     SET map_seq_col = 'RPSD_KEY'; */;

SET map_data_cols_exceptions = 'INT_RATE_VALID_FROM,INT_RATE_VALID_TO' /* Parameter:   map_data_cols_exceptions> */ /* Mandatory:   No */ /* Description: Set of columns that has same naming as technical columns (mostly *_VALID_FROM,*_VALID_TO) */ /* Example:     SET map_soft_delete = 'INT_RATE_VALID_FROM,INT_RATE_VALID_TO'; */;

SET map_soft_delete = TRUE /* Parameter:   map_soft_delete> */ /* Mandatory:   Yes */ /* Description: Enable or disable Soft Delete funcionality */ /* Example1:    SET map_soft_delete = false; */ /* Example2:    SET map_soft_delete = true; */;

SET map_subset_filter = '/* Last 3 months */ TO_DATE(PHASE_DATETIME) > DATEADD(\'MONTH\', -3, $p_load_date) AND /* Channel filter */ CHANNEL_ID<>\'BRANCH\'' /* Parameter:   map_subset_filter */ /* Mandatory:   No */ /* Description: SQL filter definition that is used in dynamic WHERE condition to filter Source/Target data during processing */ /* Example1:    SET map_subset_filter = 'TO_DATE(PHASE_DATETIME) > DATEADD(''MONTH'', -3, $p_load_date)' */ /* Example2:    SET map_subset_filter = 'CHANNEL_ID=''BRANCH'' */;

/* Parameter:   p_load_date */ /* Mandatory:   No */ /* Description: Transformation Business date */ /* Note:        Set this parameter ONLY when you don't want to use variable P_EFFECTIVE_DATE! Best practice is using P_EFFECTIVE_DATE which is set from Rockify. */ /* Example1:    SET p_load_date = current_date; */ /* Example2:    SET p_load_date = current_date; */ /* SET p_load_date = current_date; */;