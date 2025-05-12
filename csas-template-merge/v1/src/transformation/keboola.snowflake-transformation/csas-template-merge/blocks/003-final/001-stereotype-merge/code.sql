/**********************************************************************************************************************/
/* Shared Code:        MERGE Stereotype Keboola Implementation                                                        */
/* Purpose:            Loads data into Target table using MERGE stereotype with DELETED_FLAG                          */
/*                                                                                                                    */
/* Change History:                                                                                                    */
/* Date            Author               Change                                                                        */
/* 2024-03-25      Filip Oliva          Initial version                                                               */
/* 2024-04-26      Filip Oliva          Primary key can have N columns                                                */
/* 2024-05-16      Filip Oliva          Soft Delete is optional, Sequence is optional,Subset filter,                  */
/*                                      XC duplicity check                                           */
/*                                                                                                                    */
/* Description:                                                                                                       */
/* Procedure merge date from XC table, set Deleted Flag and Updated date/task_key in target table                     */
/**********************************************************************************************************************/

/********************************************** BEGIN: Session Variables used for debuging **********************************************/
/*
SET p_load_date = to_date('2024-04-30','yyyy-mm-dd');
SET p_task_key = -98174::number(38,0);
SET p_proc_key = -98174::number(38,0);
SET map_bucket = 'out.c-TESTDATA'; 
SET map_target_table = 'RPDM_SALES_PHASES_MRG';
--SET map_module_id = 'CURRACC';
SET map_module_id = 'UNSEC';
SET map_pk = 'RPSP_SOURCE_ID,PHASE_TYPE_ID';
SET map_seq_col = 'RPSP_KEY';
SET map_soft_delete = false;
SET map_subset_filter = 'CHANNEL_ID=''BRANCH''';
SET map_data_cols_exceptions = 'INT_RATE_VALID_FROM,INT_RATE_VALID_TO';
*/

/********************************************** END: Session Variables used for debuging **********************************************/

/********************************************** BEGIN: Session Variables for MERGE **********************************************/
SET map_xc_table = 'XC_' || $map_target_table || '_' ||$map_module_id;

/********************************************** END: Session Variables for MERGE **********************************************/

EXECUTE IMMEDIATE $$
DECLARE

/********************************************** BEGIN: Variables  **********************************************/

p_Cmd_Final varchar := '';

p_SQL_Steps object := OBJECT_CONSTRUCT();

/********************************************** END: Variables  **********************************************/

BEGIN
/* Generate Target Table Column Metadata */
CALL CREATE_TAB_META();

/* Sequence init */
IF (trim($map_seq_col)<>'') 
  THEN call SEQUENCE_SET($map_bucket, $map_target_table, $map_seq_col);
END IF;

/********************************************** BEGIN: SQL Templates - Define Steps **********************************************/
/*** Note: Prefix number in StepID is used for step order (Example: 10:INS_CURR_TRG ***/

/*** Step MERGE_TEMP_TARGET: Truncate Temporary Target Table ***/ 	
p_Cmd_Final:= 'CREATE OR REPLACE TABLE ' || $map_target_table || ' AS \nSELECT \n'||
CASE $map_seq_col WHEN '' THEN ''
ELSE '/* Sequence column */ \nNVL(trg.'||$map_seq_col||', '||$map_target_table||'_seq.nextval) AS #SEQ_COL#,\n'
END
/* Data columns */
||'#NVL_SRC_TRG# 
/* Audit attributes */,
'''||$map_module_id||''' #MODULE_ID_COL#, \n'||
IFF($map_soft_delete, '/* Deleted Flag */ \nNVL2(src.#PK_KEY_1ST_COL#, ''N'', ''Y'') #DELETED_FLAG_COL#, \n', '')
||'NVL(trg.#INS_TMS#, CURRENT_TIMESTAMP) #INS_TMS#,
NVL(trg.#INS_KEY#, '||$p_task_key||') #INS_KEY#,
CURRENT_TIMESTAMP #UPD_TMS#,
'||$p_task_key||' #UPD_KEY#
FROM (SELECT * FROM '||$map_xc_table||' 
   WHERE 1=1 
   #SUBSET_FILTER#
   )src \n'||
IFF($map_soft_delete, ' FULL ', ' LEFT ') ||' OUTER JOIN (SELECT * FROM "'||$map_bucket||'".'||$map_target_table||
' WHERE #MODULE_ID_COL# = '''||$map_module_id||'''
  #SUBSET_FILTER#
  ) trg
 ON #PK_KEY_ON_COND# 
WHERE 1=1 AND 
(-- Changed records
#COMPARE_CHANGES_COLS# \n'||
CASE $map_soft_delete WHEN true THEN 
'-- Undelete record
OR DECODE(NVL2(src.#PK_KEY_1ST_COL#, ''N'', ''Y''), trg.#DELETED_FLAG_COL#, 1, 0) = 0 \n'
ELSE '' END ||
')'
;

p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps,'MERGE_STEP_15:MERGE_INTO_TARGET',p_Cmd_Final, true);

/********************************************** BEGIN: SQL Templates - Replace Placeholders **********************************************/
/*#ALL_COLS_WITHOUT_DIFF#*/
CALL get_columns('COLUMN_TYPE','DIFF_%','NOT LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#ALL_COLS_WITHOUT_DIFF#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#DELETED_FLAG_COL#*/
CALL get_columns('COLUMN_TYPE','DELETED_FLAG','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#DELETED_FLAG_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#SEQ_COL#*/
CALL get_columns('SEQ_COL_FLAG','Y', 'LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#SEQ_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#MODULE_ID_COL#*/
CALL get_columns('COLUMN_TYPE','MODULE_ID','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#MODULE_ID_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#INS_TMS#*/
CALL get_columns('COLUMN_TYPE','INS_TMS','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#INS_TMS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#UPD_TMS#*/
CALL get_columns('COLUMN_TYPE','UPD_TMS','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#UPD_TMS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#INS_KEY#*/
CALL get_columns('COLUMN_TYPE','INS_KEY','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#INS_KEY#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#UPD_KEY#*/
CALL get_columns('COLUMN_TYPE','UPD_KEY','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#UPD_KEY#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#COMPARE_CHANGES_COLS#*/
CALL GET_COLUMNS_COMPARISON() INTO :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#COMPARE_CHANGES_COLS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#PK_KEY_ON_COND#*/
CALL GET_PK_COLUMNS_JOIN() into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#PK_KEY_ON_COND#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#PK_KEY_1ST_COL#*/
CALL get_pk_columns() into :p_Cmd_Final;

p_Cmd_Final := SPLIT(p_Cmd_Final,',')[0];

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#PK_KEY_1ST_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#NVL_SRC_TRG#*/
CALL GET_COLUMNS_NVL_SRC_TRG() into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#NVL_SRC_TRG#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#SUBSET_FILTER#*/
IF (trim($map_subset_filter)='') 
  THEN p_Cmd_Final := '\n AND 1=1 ';
  ELSE p_Cmd_Final := '/*Subset filter*/ \n AND '||$map_subset_filter||' ';
END IF;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final , '#SUBSET_FILTER#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/********************************************** END: SQL Templates - Replace Placeholders **********************************************/


/********************************************** BEGIN: Command Steps - Execute **********************************************/

CALL EXECUTE_CMD_STEPS(:p_SQL_Steps, false);

/********************************************** END: Command Steps - Execute **********************************************/

/* XC Duplicity Check */
CALL XC_DUP_CHECK('MERGE_STEP_30');

RETURN 'Done OK';

END;

$$
