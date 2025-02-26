SET map_xc_table = 'XC_' || @map_target_table || '_' || @map_module_id /* ******************************************************************************************************************** */ /* Shared Code:        SCD2 Stereotype Keboola Implementation                                                         */ /* Purpose:            Loads data into Target table using SCD2 historization (Valid FROM/To)                          */ /*                                                                                                                    */ /* Change History:                                                                                                    */ /* Date            Author               Change                                                                        */ /* 2024-03-25      Filip Oliva          Initial version                                                               */ /* 2024-04-24      Filip Oliva          Primary key can have N columns                                                */ /* 2024-04-25      Filip Oliva          MODULE_ID filter, Temp Target table creation                                  */ /* 2024-05-22      Filip Oliva          Subset filter, Duplicity Check, Soft Delete is optional                     
/*                                                                                                                    */ /* Description:                                                                                                       */ /* Procedure prepare data IN DIFF table which is THEN used for historization into target table                         */ /* ******************************************************************************************************************** */ /* ********************************************* BEGIN: Session Variables used for debuging ********************************************* */ /*
SET p_load_date = to_date('2024-04-18','yyyy-mm-dd');
SET p_task_key = -98174::number(38,0);
SET p_proc_key = -98174::number(38,0);
SET map_bucket = 'out.c-TESTDATA';
SET map_target_table = 'TST_OKO_PRODUCTS';
SET map_module_id = 'MAIN';
SET map_pk = 'OKOPROD_SOURCE_ID, OKOPROD_VALID_TO';
SET map_seq_col = '';
SET map_soft_delete = true;
SET map_subset_filter = 'OKOPROD_LEAF_FLAG=''N''';
SET map_data_cols_exceptions = '';
*/ /* ********************************************* END: Session Variables used for debuging ********************************************* */ /* ********************************************* BEGIN: Session Variables for SCD ********************************************* */
/* ********************************************* END: Session Variables for SCD ********************************************* */ /* ********************************************* END: Session Variables used for debuging ********************************************* */
EXECUTE IMMEDIATE $$

DECLARE

/********************************************** BEGIN: Variables  **********************************************/
p_Diff_Table := $map_target_table || '_DIFF';

p_Cmd_Final varchar := '';

p_SQL_Steps object := OBJECT_CONSTRUCT();

/********************************************** END: Variables  **********************************************/

BEGIN
/* Generate Target Table Column Metadata */
CALL CREATE_TAB_META();

/* Create Local DIFF Table */
call CREATE_TAB('DIFF');

/* Create Local TARGET Table */
call CREATE_TAB('TMP_TRG');

/* SCD load pre-check */
CALL SCD_LOAD_CHECK();

/********************************************** BEGIN: SQL Templates - Define Steps **********************************************/
/*** Note: Prefix number in StepID is used for step order (Example: 10:INS_CURR_TRG ***/

/*** Step XC_DUP_CHECk: Check duplicity in XC table  ***/
CALL XC_DUP_CHECK('SCD_STEP_03');

/*** Step INS_CURR_TRG: Insert Current Records (1.1.3000) FROM TARGET Table Into DIFF Table ***/
p_Cmd_Final := 'INSERT INTO '||p_Diff_Table||'
(
#ALL_COLS#
)
SELECT 
''N'' tech$new_rec,
''N'' tech$changed_rec,
''N'' tech$del_flg,
#ALL_COLS_WITHOUT_DIFF#
  FROM "'||$map_bucket||'".'||$map_target_table||' p
WHERE #VALID_TO_COL# = ''3000-01-01''::DATE
  AND #MODULE_ID_COL# = '''||$map_module_id||'''
  #SUBSET_FILTER# ';

p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps,'SCD_STEP_05:INS_CURR_TRG',p_Cmd_Final, true);

/*** Step INS_NEW_CHANGED: Insert NEW AND CHANGED Records To DIFF Table ***/
p_Cmd_Final := 'INSERT INTO '||p_Diff_Table||'
(
#ALL_COLS#
)
SELECT 
CASE WHEN trg.#MODULE_ID_COL# IS NULL THEN ''Y'' ELSE ''N'' END AS tech$new_rec,
''Y'' AS tech$changed_rec ,
''N'' AS tech$del_rec, 
#ALL_SRC_DATA_COLS#
,'''||$p_load_date||'''::DATE AS #VALID_FROM_COL#, 
to_date(''3000-01-01'',''YYYY-MM-DD'') AS #VALID_TO_COL#, 
''Y'' AS #CURRENT_FLAG_COL#,'|| 
IFF($map_soft_delete, '\n /* Deleted Flag */ \n ''N'' AS #DELETED_FLAG_COL#,', '')||'
'''||$map_module_id||''' AS #MODULE_ID_COL#,
CURRENT_TIMESTAMP as INSERTED_DATETIME, 
'||$p_task_key||' as INSERT_TASKINS_KEY, 
CURRENT_TIMESTAMP as UPDATED_DATETIME,
'||$p_task_key||' as UPDATE_TASKINS_KEY   
FROM 
 (SELECT 
  #ALL_DATA_COLS#
  FROM '||$map_xc_table||' xc 
  WHERE 1=1 
  #SUBSET_FILTER# ) src
LEFT JOIN          
    (SELECT  t.* 
      FROM '||p_Diff_Table||' t
     WHERE tech$changed_rec = ''N'' ) trg 
ON #PK_KEY_ON_COND#
WHERE 
-- Changed records
#COMPARE_CHANGES_COLS#
-- New Records
OR trg.#MODULE_ID_COL# is null \n'||
/* Deleted Records */
CASE $map_soft_delete WHEN true THEN 
' OR trg.#DELETED_FLAG_COL# = ''Y'' \n'
ELSE '' END
;

p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps, 'SCD_STEP_10:INS_NEW_CHANGED', p_Cmd_Final, true);

/*** Step INS_DELETED: Insert  Deleted Records To DIFF Table ***/
p_Cmd_Final := 'INSERT INTO '||p_Diff_Table||'
(
#ALL_COLS#
)
SELECT   
''N'' as tech$new_rec, 
''Y'' as tech$changed_rec ,
''Y'' as tech$del_flg,    
#ALL_TRG_DATA_COLS#
,'''||$p_load_date||'''::DATE as #VALID_FROM_COL#, 
to_date(''3000-01-01'',''YYYY-MM-DD'') as #VALID_TO_COL#, 
''Y'' as #CURRENT_FLAG_COL#, 
''Y'' as #DELETED_FLAG_COL#,
'''||$map_module_id||''' as #MODULE_ID_COL#,
CURRENT_TIMESTAMP as INSERTED_DATETIME, 
'||$p_task_key||' as INSERT_TASKINS_KEY, 
CURRENT_TIMESTAMP as UPDATED_DATETIME,
'||$p_task_key||' as UPDATE_TASKINS_KEY 
FROM 
(select #PK_KEY_COLS#,
1 CHECK_COL
   from '||$map_xc_table||' xc
    WHERE 1=1 
    #SUBSET_FILTER# ) src
RIGHT JOIN 
(select  t.* 
  from '||p_Diff_Table||' t
  where #DELETED_FLAG_COL# = ''N''
   and tech$changed_rec = ''N'' -- Puvodni CURRENT zaznam
) trg 
ON #PK_KEY_ON_COND#
WHERE src.CHECK_COL is null -- Neni ve zdroji (src)
';

/*# Soft DELETE #*/
IF ($map_soft_delete) 
  THEN p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps,'SCD_STEP_15:INS_DELETED',p_Cmd_Final, true);
END IF;

/*** Step CLOSE OLD: Close OLD Records IN DIFF Table ***/
p_Cmd_Final := 'UPDATE '||p_Diff_Table||' 
SET
UPDATED_DATETIME = CURRENT_TIMESTAMP,
UPDATE_TASKINS_KEY = '||$p_task_key||',
#CURRENT_FLAG_COL# = ''N'', 
#VALID_TO_COL# = '''||$p_load_date||'''::DATE - 1,
tech$changed_rec = ''Y''
WHERE #CURRENT_FLAG_COL# = ''Y''
  and #VALID_TO_COL# = to_date(''3000-01-01'',''YYYY-MM-DD'')
  and (#PK_KEY_COLS#) IN 
 (SELECT #PK_KEY_COLS# FROM '||p_Diff_Table||' WHERE tech$new_rec = ''N'' AND tech$changed_rec = ''Y'') -- Na záznamu byla změna a není nový
   AND tech$changed_rec = ''N'' -- Jedná se o původni current záznam
';

p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps,'SCD_STEP_20:CLOSE_OLD',p_Cmd_Final, true);

/*** Step DELETE_UNCHANGED: Delete Unchanged Records in DIFF Table ***/ 	
p_Cmd_Final:= 'DELETE FROM '||p_Diff_Table||' WHERE tech$changed_rec = ''N''';

p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps,'SCD_STEP_25:DELETE_UNCHANGED',p_Cmd_Final, true);

/*** Step TRUNCATE_TEMP_TARGET: Truncate Temporary Target Table ***/ 	
p_Cmd_Final:= 'TRUNCATE TABLE '||$map_target_table;

p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps,'SCD_STEP_30:TRUNCATE_TEMP_TARGET',p_Cmd_Final, true);

/*** Step TARGET_MERGE_TEST: Merge DIFF Table Into Target Table (for debug) ***/ 	
/* Poznamka: Merge je zde kvuli testovani na Snowflake, pri kterem lze provadet opakovane spousteni a testovat jak se stereotyp chova */
p_Cmd_Final:='MERGE INTO '||$map_target_table||' trg
USING (
SELECT 
#ALL_COLS_WITHOUT_DIFF#
FROM '||p_Diff_Table||') src
ON #PK_KEY_ON_COND# AND 
   src.#VALID_TO_COL# = trg.#VALID_TO_COL#
WHEN MATCHED THEN
  UPDATE
     SET 
#COLUMNS_FOR_UPDATE#
WHEN NOT MATCHED THEN
  INSERT
(
#ALL_COLS_WITHOUT_DIFF#
)
  VALUES
(
#ALL_COLS_WITHOUT_DIFF#
)
';

p_SQL_Steps := OBJECT_INSERT(p_SQL_Steps,'SCD_STEP_35:TARGET_MERGE',p_Cmd_Final, true);

/********************************************** END: SQL Templates - Define Steps  **********************************************/

/********************************************** BEGIN: SQL Templates - Replace Placeholders **********************************************/
/*#ALL_COLS#*/
CALL get_columns('COLUMN_NAME','','ALL') into :p_Cmd_Final;

/* Puvodni verze s vyuzitim RETURN 
 CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#ALL_COLS#') into :p_SQL_Steps;
*/
CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#ALL_COLS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#ALL_COLS_WITHOUT_DIFF#*/
CALL get_columns('COLUMN_TYPE','DIFF_%','NOT LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#ALL_COLS_WITHOUT_DIFF#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#ALL_DATA_COLS#*/
CALL get_columns('COLUMN_TYPE','DATA_COL','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#ALL_DATA_COLS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#ALL_SRC_DATA_COLS#*/
CALL get_columns('COLUMN_TYPE','DATA_COL','LIKE','src.') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#ALL_SRC_DATA_COLS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#ALL_TRG_DATA_COLS#*/
CALL get_columns('COLUMN_TYPE','DATA_COL','LIKE','trg.') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#ALL_TRG_DATA_COLS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#PK_KEY_COLS#*/
CALL get_pk_columns() into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#PK_KEY_COLS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#PK_KEY_ON_COND#*/
CALL GET_PK_COLUMNS_JOIN() into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#PK_KEY_ON_COND#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#VALID_FROM_COL#*/
CALL get_columns('COLUMN_TYPE','VALID_FROM','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#VALID_FROM_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#VALID_TO_COL#*/
CALL get_columns('COLUMN_TYPE','VALID_TO','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#VALID_TO_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#CURRENT_FLAG_COL#*/
CALL get_columns('COLUMN_TYPE','CURRENT_FLAG','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#CURRENT_FLAG_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#DELETED_FLAG_COL#*/
CALL get_columns('COLUMN_TYPE','DELETED_FLAG','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#DELETED_FLAG_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#MODULE_ID_COL#*/
CALL get_columns('COLUMN_TYPE','MODULE_ID','LIKE') into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#MODULE_ID_COL#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#COMPARE_CHANGES_COLS#*/
CALL get_columns_comparison() into :p_Cmd_Final;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final, '#COMPARE_CHANGES_COLS#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#COLUMNS_FOR_UPDATE#*/
CALL GET_COLUMNS_FOR_UPDATE() into :p_Cmd_Final;

CALL REPLACE_CMD_PLACEHOLDERS(:p_SQL_Steps, :p_Cmd_Final, '#COLUMNS_FOR_UPDATE#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/*#SUBSET_FILTER#*/
IF (trim($map_subset_filter)='') 
  THEN p_Cmd_Final := ' AND 1=1 ';
  ELSE p_Cmd_Final := ' /*Subset filter*/ \n AND '||$map_subset_filter||' ';
END IF;

CALL replace_cmd_placeholders(:p_SQL_Steps, :p_Cmd_Final , '#SUBSET_FILTER#');

SELECT out_result INTO :p_SQL_Steps FROM PROCEDURE_LAST_RESULT;

/********************************************** END: SQL Templates - Replace Placeholders **********************************************/


/********************************************** BEGIN: Command Steps - Execute **********************************************/

call EXECUTE_CMD_STEPS(:p_SQL_Steps, false);

/********************************************** END: Command Steps - Execute **********************************************/

RETURN 'Done OK';

END;

$$