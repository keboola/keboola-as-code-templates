/**********************************************************************************************************************/
/* Shared Code:        Standard ETL Library					                                                          */
/* Purpose:            Support functions and procedures for Custom Keboola ETL in CS                                  */
/*                                                                                                                    */
/* Change History:                                                                                                    */
/* Date            Author               Change                                                                        */
/* 2024-03-25      Filip Oliva          Initial version                                                               */
/* 2024-04-23      Filip Oliva          Primary key can have N columns                                                */
/* 2024-05-16      Filip Oliva          Soft Delete is optional, Sequence is optional, XC duplicity check             */
/* 2024-05-20      Filip Oliva          Add <map_set_data_cols> parameter for data column names exceptions            */
/*                                                                                                                    */
/* Description:                                                                                                       */
/* Procedures are used in user Snowflake SQL Transformations in stereotypes Merge, SCD etc.                           */
/**********************************************************************************************************************/

/********************************************** START: DEFINE SESSION VARIABLES  **********************************************/
/* Variables from ROCKIFY */

SET p_load_date = to_date('{{P_EFFECTIVE_DATE}}','yyyy-mm-dd');

SET p_task_key = {{P_TASKINS_KEY}}::NUMBER(38,0);

SET p_proc_key = {{P_PROCESS_KEY}}::NUMBER(38,0);

/*
SET p_load_date = '2024-04-01';
SET p_task_key = '999';
SET p_proc_key = '999';
*/

/* User variables, VALUES will be SET later in transformation (in block "Custom ETL parameters")*/

-- Target table bucket

SET map_bucket = '';

--Target table name

SET map_target_table = 'A';

--XC table name

SET map_xc_table = '';

-- Module (load phase) ID, default is MAIN

SET map_module_id = '';

-- Table PK columns;

SET map_pk = '';

-- Table Sequence Column;
SET map_seq_col = '';

-- Soft delete functionality (True|False);
SET map_soft_delete = '';

-- Mapping subset filter;
SET map_subset_filter = '';

-- Mapping Data Column Name Exceptions;
SET map_data_cols_exceptions = '';

/********************************************** END: DEFINE SESSION VARIABLES  **********************************************/

/********************************************** START: Procedure SEQUENCE_SET - Generate temporary sequence  ***********************************/
CREATE OR REPLACE PROCEDURE SEQUENCE_SET(
        P_BUCKET_NAME VARCHAR(400),
        P_TABLE_NAME VARCHAR(128),
        P_KEY_COL_NAME VARCHAR(128)
    )
    RETURNS NUMBER NOT NULL
    LANGUAGE SQL
    AS $$
  DECLARE
    v_SeqStartValue NUMBER := 10;
    v_SQL VARCHAR;
    v_Res RESULTSET;
    v_key_val NUMBER(38,0);
  BEGIN
   /* Define dynamic SQL */ 
   v_SQL := 'SELECT NVL(MAX('||P_KEY_COL_NAME||' + 2), '||v_SeqStartValue||') max_key FROM "'||P_BUCKET_NAME||'".'||P_TABLE_NAME;
   /* Execute dynamic SQL */
   v_Res := (EXECUTE IMMEDIATE :v_SQL);
   /* Fetch result INTO cursor */
   LET cur CURSOR FOR v_res;
   OPEN cur;
   FETCH cur INTO v_key_val;
   CLOSE cur;
   /* Check value */
   EXECUTE IMMEDIATE 'CREATE OR REPLACE SEQUENCE '||P_TABLE_NAME||'_SEQ START = '||v_key_val||' INCREMENT = 1';
   RETURN v_key_val; 
  END;
  $$;

/********************************************** END: Procedure SEQUENCE_SET - Generate temporary sequence  ***********************************/
  
/********************************************** START: TABLE - ETL_TASK_LOGS  **********************************************/
CREATE OR REPLACE TABLE ETL_TASK_LOGS
( log_key             NUMBER(38,0) ,
  log_target_table_name VARCHAR(400),
  log_target_bucket   VARCHAR(4000),
  log_module_id       VARCHAR(400),
  log_effective_date  DATE,
  log_step_id         VARCHAR(120),
  log_start_datetime  TIMESTAMP_NTZ(0),
  log_end_datetime    TIMESTAMP_NTZ(0),
  log_cnt_rows        INTEGER,
  log_status          VARCHAR(30) not null,
  log_message         VARCHAR(4000),
  log_params          VARCHAR(4000),
  log_command 		    VARCHAR(100000),
  log_process_key     INTEGER,
  log_task_key        INTEGER
);

/********************************************** END: TABLE - ETL_TASK_LOGS  **********************************************/

/********************************************** START: Procedure LOG_TASK - Log execution  **********************************************/
CREATE OR REPLACE PROCEDURE LOG_TASK(
  log_target_table_name VARCHAR DEFAULT null,
  log_target_bucket   VARCHAR DEFAULT null,
  log_module_id       VARCHAR DEFAULT 'MAIN',
  log_effective_date  DATE DEFAULT CURRENT_TIMESTAMP,
  log_step_id         VARCHAR DEFAULT null,
  log_cnt_rows        INTEGER DEFAULT 0,
  log_status          VARCHAR DEFAULT 'RUN',
  log_message         VARCHAR DEFAULT '',
  log_command 		    VARCHAR DEFAULT null,
  log_params           VARCHAR DEFAULT null,
  log_key             NUMBER DEFAULT null
    )
RETURNS NUMBER 
LANGUAGE SQL
EXECUTE AS CALLER
AS 
$$
  DECLARE
    v_key_val NUMBER(38,0);
  BEGIN
    SELECT to_number(to_char(current_timestamp,'yyyymmddhh24missff'))
    INTO v_key_val;
  IF (log_key IS NULL) THEN
  INSERT into
    ETL_TASK_LOGS (
        log_key,
        log_target_table_name,
        log_target_bucket,
        log_module_id,
        log_effective_date,
        log_step_id,
        log_start_datetime,
        log_end_datetime,
        log_cnt_rows,
        log_status,
        log_message,
        log_command,
        log_params,
        log_process_key,
        log_task_key
    )
VALUES
    (
        :v_key_val ,
        :log_target_table_name,
        :log_target_bucket,
        :log_module_id,
        :log_effective_date,
        :log_step_id,
        CURRENT_TIMESTAMP,
        CURRENT_TIMESTAMP,
        :log_cnt_rows,
        :log_status,
        :log_message,
        :log_command,
        :log_params,
        $p_proc_key,
        $p_task_key
    );
   ELSE 
     UPDATE ETL_TASK_LOGS
      SET log_status = :log_status,
          log_message = :log_message,
          log_end_datetime = CURRENT_TIMESTAMP,
          log_cnt_rows = nvl(:log_cnt_rows,0)
     WHERE log_key = :log_key;
   END IF;
   COMMIT;
   /* Keboola bug with snowflake procedure with IN/OUT params, nahrada RETURN - zadan Support ticket */
   CREATE OR REPLACE TABLE PROCEDURE_LAST_RESULT AS SELECT :v_key_val AS out_result;
   RETURN (v_key_val);
  END;
$$;

/********************************************** END: Procedure LOG_TASK - Log execution  **********************************************/
      
/********************************************** BEGIN: Procedure CREATE_TAB_META - Save table columns metadata  ******************************/
CREATE OR REPLACE PROCEDURE CREATE_TAB_META()
  RETURNS NUMBER 
  LANGUAGE SQL
  EXECUTE AS CALLER
AS 
$$
DECLARE
 arr_data_cols ARRAY;
BEGIN
 arr_data_cols := STRTOK_TO_ARRAY($map_data_cols_exceptions, ',');
CREATE OR REPLACE TABLE tb_tab_meta AS 
WITH 
pk_cols as (
  SELECT VALUE::varchar PK_COL_NAME
     FROM TABLE(FLATTEN(INPUT => SPLIT($map_pk, ',')))
),
tcols as (
    SELECT
        column_name,
        ordinal_position pos,
        is_nullable,
        /* Primary Key */
        CASE
            WHEN pk_col_name LIKE column_name THEN 'Y'
            ELSE 'N'
        end pk_key_flag,
        /* Sequence column */
        CASE
            WHEN column_name LIKE $map_seq_col THEN 'Y'
            ELSE 'N'
        end seq_col_flag,        
        /* Technical column flag */
        CASE
            WHEN ARRAY_CONTAINS(column_name::VARIANT ,:arr_data_cols) THEN 'N'
            WHEN column_name LIKE '%VALID_FROM' THEN 'Y'
            WHEN column_name LIKE '%VALID_TO' THEN 'Y'
            WHEN column_name LIKE '%CURRENT_FLAG' THEN 'Y'            
            WHEN $map_soft_delete AND column_name LIKE '%DELETED_FLAG' THEN 'Y'
            WHEN column_name LIKE '%MODULE_ID' THEN 'Y' 
            WHEN column_name LIKE '%INSERTED_DATETIME' THEN 'Y'
            WHEN column_name LIKE '%INSERT_TASKINS_KEY' THEN 'Y'
            WHEN column_name LIKE '%UPDATED_DATETIME' THEN 'Y'
            WHEN column_name LIKE '%UPDATE_TASKINS_KEY' THEN 'Y'
            ELSE 'N'
        END tech_col_flag,
        CASE
           WHEN ARRAY_CONTAINS(column_name::VARIANT ,:arr_data_cols) THEN 'DATA_COL'
           WHEN column_name LIKE '%INSERTED_DATETIME' THEN 'INS_TMS'
           WHEN column_name LIKE '%INSERT_TASKINS_KEY' THEN 'INS_KEY'
           WHEN column_name LIKE '%UPDATED_DATETIME' THEN 'UPD_TMS'
           WHEN column_name LIKE '%UPDATE_TASKINS_KEY' THEN 'UPD_KEY' 
           WHEN column_name LIKE '%VALID_FROM' THEN 'VALID_FROM'
           WHEN column_name LIKE '%VALID_TO' THEN 'VALID_TO'
           WHEN column_name LIKE '%CURRENT_FLAG' THEN 'CURRENT_FLAG'
           WHEN column_name LIKE '%MODULE_ID' THEN 'MODULE_ID' 
           WHEN $map_soft_delete AND column_name LIKE '%DELETED_FLAG' THEN 'DELETED_FLAG'
           ELSE 'DATA_COL'
        END column_type,
        CASE 
          WHEN data_type IN ('NUMBER')
           THEN data_type||'('||numeric_precision||','||numeric_scale||')'
          WHEN data_type IN ('TEXT')
           THEN data_type||'('||character_maximum_length||')'
          WHEN data_type IN ('TIMESTAMP_NTZ','TIMESTAMP_LTZ')
           THEN data_type||'('||datetime_precision||')'
          ELSE data_type
        END ddl_data_type
    FROM
        INFORMATION_SCHEMA.COLUMNS c
        LEFT join pk_cols p 
          ON c.COLUMN_NAME = p.PK_COL_NAME 
    WHERE
        table_name = $map_target_table
        AND table_schema = $map_bucket
        AND column_name NOT IN ('_timestamp') -- Exclude Keboola technical timestamp
 UNION ALL
 /* Technical flag IN DIFF table */
 SELECT 'TECH$CHANGED_REC' column_name, 300 pos, 'N' is_nullable, 'N' pk_key_flag, 'N' seq_col_flag, 'Y' tech_col_flag, 'DIFF_CHANGED' column_type, 'VARCHAR(1)' ddl_data_type UNION ALL
 SELECT 'TECH$DEL_REC' column_name, 310 pos, 'N' is_nullable, 'N' pk_key_flag, 'N' seq_col_flag, 'Y' tech_col_flag, 'DIFF_DEL' column_type, 'VARCHAR(1)' ddl_data_type UNION ALL
 SELECT 'TECH$NEW_REC' column_name, 320 pos, 'N' is_nullable, 'N' pk_key_flag, 'N' seq_col_flag, 'Y' tech_col_flag, 'DIFF_NEW' column_type, 'VARCHAR(1)' ddl_data_type  
       
)
SELECT 
    /* Set Column Order IN Stage Tables */
    ROW_NUMBER ()  
    OVER(ORDER BY CASE 
     WHEN COLUMN_TYPE = 'DIFF_NEW' THEN 10
     WHEN COLUMN_TYPE = 'DIFF_CHANGED' THEN 12
     WHEN COLUMN_TYPE = 'DIFF_DEL' THEN 14
     WHEN COLUMN_TYPE = 'DATA_COL' THEN 20
     WHEN COLUMN_TYPE = 'VALID_FROM' THEN 30
     WHEN COLUMN_TYPE = 'VALID_TO' THEN 40
     WHEN COLUMN_TYPE = 'CURRENT_FLAG' THEN 50
     WHEN COLUMN_TYPE = 'DELETED_FLAG' THEN 60
     WHEN COLUMN_TYPE = 'VALID_FROM' THEN 70
     WHEN COLUMN_TYPE = 'MODULE_ID' THEN 80
     WHEN COLUMN_TYPE = 'INS_TMS' THEN 90
     WHEN COLUMN_TYPE = 'INS_KEY' THEN 100
     WHEN COLUMN_TYPE = 'UPD_TMS' THEN 110
     WHEN COLUMN_TYPE = 'UPD_KEY' THEN 120
     ELSE 500
     END, pos) column_ord,
    column_name,
    column_type,
    pk_key_flag,
    seq_col_flag,
    tech_col_flag,
    ddl_data_type
  FROM tcols;
  END;
  $$;

/********************************************** END: Procedure CREATE_TAB_META - Save table columns metadata  **************************/

/********************************************** BEGIN: Procedure CREATE_TABLE - Create table structure **********************/
CREATE OR REPLACE PROCEDURE CREATE_TAB(p_table_type VARCHAR)
  RETURNS VARCHAR 
  LANGUAGE SQL
  EXECUTE AS CALLER
AS 
$$
DECLARE
 p_Columns VARCHAR;
 p_Cmd VARCHAR;
 p_Table_Name VARCHAR;
BEGIN
 IF (upper(p_table_type) = 'DIFF') THEN
   /* DIFF table for SCD stereotype */
   SELECT
     LISTAGG(column_name||' '||ddl_data_type, ', '||' \n') within GROUP (ORDER BY column_ord)
     INTO p_Columns
   FROM tb_tab_meta
   WHERE column_type <> IFF($map_soft_delete, 'XNA', 'DELETED_FLAG')
   ORDER BY column_ord;
   p_Table_Name := $map_target_table||'_DIFF';
 ELSEIF (upper(p_table_type) = 'TMP_TRG') THEN  
   /* Temporary Target Table */
   SELECT
     LISTAGG(column_name||' '||ddl_data_type, ', '||' \n') within GROUP (ORDER BY column_ord)
     INTO p_Columns
   FROM tb_tab_meta
    WHERE column_type NOT LIKE 'DIFF%'
      AND column_type <> IFF($map_soft_delete, 'XNA', 'DELETED_FLAG')
   ORDER BY column_ord;
   p_Table_Name := $map_target_table;
 END IF;
 
 p_Cmd := 'CREATE OR REPLACE TABLE '||p_Table_Name||' ( \n'|| p_Columns || ')';
 EXECUTE IMMEDIATE p_Cmd;
 RETURN p_Cmd;
END;
$$
;

/********************************************** END: Procedure CREATE_TABLE - Create table structure **********************/

/********************************************** START: Function ADD_LINE - Add new line into text **********************************************/
CREATE OR REPLACE FUNCTION ADD_LINE(pText VARCHAR,pTarget VARCHAR)
  RETURNS VARCHAR
  AS
  $$
    pTarget || pText || '\n'
  $$
  ;

/********************************************** END: Function ADD_LINE **********************************************/

/********************************************** START: Procedure GET_COLUMNS - Get Table Columns Metadata  **********************************************/
CREATE OR REPLACE PROCEDURE GET_COLUMNS(p_Meta_Col VARCHAR, p_Filter_Value VARCHAR, p_FilterOperator VARCHAR, p_Prefix VARCHAR default null)
  RETURNS VARCHAR
  AS
  $$
  BEGIN
    LET p_OUT varchar;
    SELECT LISTAGG(nvl(:p_Prefix,'')||column_name, ', '||' \n') WITHIN GROUP (ORDER BY column_ord) 
      INTO p_OUT
     FROM tb_tab_meta tm
    WHERE 1=1
     and 1 = CASE WHEN :p_FilterOperator = 'ALL' THEN 1
               WHEN :p_FilterOperator = 'LIKE' AND
                  identifier(:p_Meta_Col) like :p_Filter_Value THEN 1
              WHEN :p_FilterOperator = 'NOT LIKE' AND
                  identifier(:p_Meta_Col) not like :p_Filter_Value THEN 1
                  ELSE 0
          END;
  RETURN p_OUT;
  END;
$$
;

/**********************************************  END: Procedure GET_COLUMNS  **********************************************/

/********************************************** START: Procedure GET_COLUMNS_COMPARISON - Get Column VALUES Comparison  ***********************************/
 CREATE OR REPLACE PROCEDURE GET_COLUMNS_COMPARISON()
  RETURNS VARCHAR
  AS
  $$
  BEGIN
    LET p_OUT varchar;
    SELECT LISTAGG('decode(src.'||column_name||', trg.'||column_name||',1,0 ) = 0', ' OR '||'\n') WITHIN GROUP (ORDER BY column_ord) 
      INTO p_OUT
     FROM tb_tab_meta tm
    WHERE column_type = 'DATA_COL'
      AND PK_KEY_FLAG = 'N'
      AND SEQ_COL_FLAG = 'N';
  RETURN p_OUT;
  END;
$$
;

/********************************************** END: Procedure GET_COLUMNS_COMPARISON ***********************************/

/********************************************** START: Procedure GET_COLUMNS_NVL_SRC_TRG - Get Column VALUES Comparison  ***********************************/
 CREATE OR REPLACE PROCEDURE GET_COLUMNS_NVL_SRC_TRG()
  RETURNS VARCHAR
  EXECUTE AS CALLER
  AS
  $$
  BEGIN
    LET p_OUT varchar;
    SELECT 
      LISTAGG(CASE
        WHEN $map_soft_delete THEN 'NVL(src.' || column_name || ', trg.' || column_name || ') AS ' || column_name
        ELSE 'src.' || column_name || ' AS ' || column_name
      END,',\n') WITHIN GROUP (ORDER BY column_ord) 
      INTO p_OUT
     FROM tb_tab_meta tm
    WHERE column_type = 'DATA_COL'
      AND SEQ_COL_FLAG = 'N';    
    RETURN p_OUT;
  END;
$$
;

/********************************************** END: Procedure GET_COLUMNS_NVL_SRC_TRG ***********************************/

/********************************************** START: Procedure GET_COLUMNS_FOR_UPDATE - Get Column VALUES Comparison  ***********************************/
 CREATE OR REPLACE PROCEDURE GET_COLUMNS_FOR_UPDATE()
  RETURNS VARCHAR
  AS
  $$
  BEGIN
    LET p_OUT varchar;
    SELECT LISTAGG(' trg.'||column_name||' = src.'||column_name, ', '||' \n') WITHIN GROUP (ORDER BY column_ord) 
      INTO p_OUT
     FROM tb_tab_meta tm
    WHERE column_type in ('DATA_COL','VALID_FROM','CURRENT_FLAG','DELETED_FLAG','INS_TMS','INS_KEY','UPD_TMS','UPD_KEY')
      AND PK_KEY_FLAG = 'N';
  return p_OUT;
  END;
$$
;

/********************************************** END: Procedure GET_COLUMNS_FOR_UPDATE ***********************************/

/********************************************** START: Procedure GET_PK_COLUMNS_JOIN - Get Column VALUES Comparison  ***********************************/
 CREATE OR REPLACE PROCEDURE GET_PK_COLUMNS_JOIN()
  RETURNS VARCHAR
  AS
  $$
  BEGIN
    LET p_OUT varchar;
    SELECT LISTAGG(' trg.'||column_name||' = src.'||column_name, ' AND '||' \n') WITHIN GROUP (ORDER BY column_ord) 
      INTO p_OUT
     FROM tb_tab_meta tm
    WHERE column_type in ('DATA_COL') -- Data columns only
      AND PK_KEY_FLAG = 'Y';
  return p_OUT;
  END;
$$
;

/********************************************** END: Procedure GET_PK_COLUMNS_JOIN  ***********************************/

/********************************************** START: Procedure GET_PK_COLUMNS - Get PK Columns (except VALID_TO)  ***********************************/
 CREATE OR REPLACE PROCEDURE GET_PK_COLUMNS()
  RETURNS VARCHAR
  AS
  $$
  BEGIN
    LET p_OUT varchar;
    SELECT LISTAGG(column_name, ', \n') WITHIN GROUP (ORDER BY column_ord) 
      INTO p_OUT
     FROM tb_tab_meta tm
    WHERE column_type in ('DATA_COL') -- Data columns only
      AND PK_KEY_FLAG = 'Y';
  return p_OUT;
  END;
$$
;

/********************************************** END: Procedure GET_PK_COLUMNS  ***********************************/

/********************************************** START: Procedure REPLACE_CMD_PLACEHOLDERS - Replace placeholders in SQL text *********************************/
CREATE OR REPLACE PROCEDURE REPLACE_CMD_PLACEHOLDERS(p_SQL_Steps object, p_Cmd varchar, p_Placeholder varchar)
RETURNS OBJECT
AS 
$$
DECLARE
    p_Step_Keys ARRAY;
BEGIN
    p_Step_Keys := OBJECT_KEYS(p_SQL_Steps); 
    FOR  i IN 0 TO (ARRAY_SIZE(p_Step_Keys) - 1) DO
        p_SQL_Steps := OBJECT_INSERT (p_SQL_Steps, p_Step_Keys[i], REPLACE(p_SQL_Steps[p_Step_Keys[i]], p_Placeholder, p_Cmd), true);
    END FOR;
   /* Keboola bug with snowflake procedure with IN/OUT params, nahrada RETURN - zadan Support ticket */
   CREATE OR REPLACE TABLE PROCEDURE_LAST_RESULT AS SELECT :p_SQL_Steps AS out_result;
   return p_SQL_Steps;
END;
$$
;

/********************************************** END: Procedure REPLACE_CMD_PLACEHOLDERS - Replace placeholders in SQL text *********************************/

/********************************************** START: Procedure SCD_LOAD_CHECK - SCD load data pre-check *********************************/
CREATE OR REPLACE PROCEDURE SCD_LOAD_CHECK()
RETURNS VARCHAR
EXECUTE AS CALLER
AS 
$$
DECLARE
  p_cnt NUMBER(38,0);
  p_module_col VARCHAR(120);
  p_valid_from VARCHAR(120);
  p_tbl VARCHAR(1000);
  E_SCD_NEWER_VALID_FROM EXCEPTION (-20001, 'There are records with higher VALID_FROM date than currently processed P_LOAD_DATE. Change P_LOAD_DATE, repair table data or choose another action.'); 
BEGIN
  
  SELECT column_name 
    INTO :p_module_col
  FROM tb_tab_meta 
  WHERE column_type = 'MODULE_ID';

  SELECT column_name 
    INTO :p_valid_from
  FROM tb_tab_meta 
  WHERE column_type = 'VALID_FROM';
  
  p_tbl := '"'||$map_bucket||'".'||$map_target_table;
  
  SELECT Count(1)
    INTO :p_cnt
  FROM   IDENTIFIER(:p_tbl)
  WHERE IDENTIFIER(:p_valid_from) > $p_load_date
    AND IDENTIFIER(:p_module_col) = $map_module_id
    ; 

  IF (p_cnt > 0) THEN 
    RAISE E_SCD_NEWER_VALID_FROM;
  END IF;
  
  RETURN 'SCD data pre-check OK';
  END;
$$
;

/********************************************** END: Procedure SCD_LOAD_CHECK - Replace placeholders in SQL text *********************************/

/********************************************** START: Procedure XC_DUP_CHECK - Check duplicity in XC *********************************/
CREATE OR REPLACE PROCEDURE XC_DUP_CHECK(p_Step_ID varchar)
RETURNS VARCHAR
EXECUTE AS CALLER
AS 
$$
DECLARE
  p_Pk_cols VARCHAR;
  p_Step_Cmd VARCHAR;
  p_Row_Count NUMBER;
  p_Log_Key NUMBER;
  E_XC_DUP_CHECK EXCEPTION (-20001, 'There are duplicities on primary key in XC table. Check SQL transformation. '); 
BEGIN
  CALL GET_PK_COLUMNS() INTO p_Pk_cols;
  p_Step_Cmd := 
  'SELECT COUNT(1) cnt FROM
   (SELECT '||p_pk_cols||'
     FROM IDENTIFIER($map_xc_table) 
    GROUP BY '||p_pk_cols||'
     HAVING COUNT(1) > 1)';
  /* Log Step START */
  CALL LOG_TASK (
      log_target_table_name => $map_target_table,
      log_target_bucket => $map_bucket,
      log_module_id => $map_module_id,
      log_step_id => :p_Step_ID || ':XC_DUP_CHECK',
      log_effective_date => $p_load_date,
      log_command => :p_Step_Cmd
      );
  /* Keboola bug - nelze použít INTO */
  SELECT OUT_RESULT INTO :p_Log_Key FROM PROCEDURE_LAST_RESULT;
  
  EXECUTE IMMEDIATE (:p_Step_Cmd) ;
  SELECT cnt into p_Row_Count FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));
  
  IF (p_Row_Count > 0) THEN
    CALL LOG_TASK (
      log_key => :p_Log_Key,
      log_status => 'ERROR',
      log_message => 'There are duplicities on primary key '|| $map_pk ||' in XC table. Check SQL transformation. ',
      log_cnt_rows => :p_Row_Count);
    RAISE E_XC_DUP_CHECK;
  END IF;
  /* Log END of SQL Step */
  CALL LOG_TASK (
      log_key => :p_Log_Key,
      log_status => 'OK',
      log_cnt_rows => 0
  );
  RETURN 'XC Duplicity Check - OK';
END; 
$$;

/********************************************** END: Procedure XC_DUP_CHECK - Check duplicity in XC *********************************/

/********************************************** START: Procedure GET_LAST_SQL_ROWCOUNT - Get last executed SQL rowcount *********************************/
 /* Note: Native SQLROWCOUNT variable only works for INSERT OVERWRITE */
 CREATE OR REPLACE PROCEDURE GET_LAST_SQL_ROWCOUNT ()
  RETURNS VARCHAR
  LANGUAGE SQL
  EXECUTE AS CALLER
  AS
  $$
  DECLARE
    p_Result_Msg varchar; -- SQL result (could be text msg)
    p_Row_Count NUMBER;  -- Count of rows
    p_Col1_Name varchar; -- Result 1st column
    p_Col2_Name varchar; -- Result 2nd column (optional)
  BEGIN
    /* Save previous SQL result (dynamic structure) */
    CREATE OR REPLACE TEMPORARY TABLE TECH$_SQL_RESULT AS
    SELECT *
    FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()));
    
    /* Get result column names */
    SELECT c1.column_name, c2.column_name
     INTO p_Col1_Name, p_Col2_Name
    FROM information_schema.tables t
     JOIN information_schema.columns c1
        ON c1.table_name = t.table_name
       AND c1.table_schema = t.TABLE_SCHEMA
       AND c1.table_catalog = t.TABLE_CATALOG
       AND c1.ordinal_position = 1
     LEFT JOIN information_schema.columns c2
        ON c2.table_name = t.table_name
       AND c2.table_schema = t.TABLE_SCHEMA
       AND c2.table_catalog = t.TABLE_CATALOG
       AND c2.ordinal_position = 2
    WHERE t.table_name = 'TECH$_SQL_RESULT'
      AND t.is_temporary = 'YES'
      --AND t.table_schema = 'WORKSPACE_XXX'
      ;

    /* Get columns from result */ 
    p_Col1_Name := '"'||p_Col1_Name||'"';
    p_Col2_Name := '"'||p_Col2_Name||'"';
    IF (p_Col2_Name IS NULL) THEN
        SELECT identifier(:p_Col1_Name) INTO p_Result_Msg FROM TECH$_SQL_RESULT;
      ELSEIF (p_Col2_Name LIKE '%rows updated"') THEN
        SELECT identifier(:p_Col1_Name) + identifier(:p_Col2_Name) INTO p_Result_Msg FROM TECH$_SQL_RESULT;
    END IF;
    
    /* Try String to NUMBER conversion */
    SELECT  TRY_TO_NUMBER(:p_Result_Msg) INTO :p_Row_Count;
    
    /* Try to get rowcount of CTAS operation */
    IF (p_Result_Msg LIKE 'Table%successfully created.') THEN
      SELECT COUNT(1) INTO :p_Row_Count FROM identifier($map_target_table);
    END IF;
    RETURN p_Row_Count;
     EXCEPTION
      WHEN OTHER THEN RETURN null;
    
  END;
  $$
 ;

/********************************************** END: Procedure GET_LAST_SQL_ROWCOUNT - Get last executed SQL rowcount *********************************/

/********************************************** START: Procedure GET_SESS_VARS - Get current session variable  ***********************************/
CREATE OR REPLACE PROCEDURE GET_SESS_VARS()
  RETURNS VARCHAR
  LANGUAGE SQL
  EXECUTE AS CALLER
  AS
$$
DECLARE
  p_Params VARCHAR;
BEGIN
 SHOW VARIABLES;
 SELECT listagg ('SET ' || "name" || ' = ''' || "value" || ''';','\n')
   INTO :p_Params
    FROM TABLE(RESULT_SCAN(LAST_QUERY_ID()))
  WHERE "name" LIKE 'MAP%'
       OR "name" IN ('P_LOAD_DATE','P_TASK_KEY','P_PROC_KEY'); 
 RETURN p_Params;  
 EXCEPTION
   WHEN OTHER THEN null; 
END; 
$$    
;

/********************************************** END: Procedure GET_SESS_VARS - Get current session variable  ***********************************/    
 
/********************************************** START: Procedure EXECUTE_CMD_STEPS - Execute SQL Command Steps  ***********************************/
 CREATE OR REPLACE PROCEDURE EXECUTE_CMD_STEPS(p_SQL_Steps object, p_Log_Only BOOLEAN default FALSE)
  RETURNS VARCHAR
  LANGUAGE SQL
  EXECUTE AS CALLER
  AS
  $$
  DECLARE
    p_Step_Keys ARRAY;
    p_Step_Cmd VARCHAR;
    p_Step_Code VARCHAR;
    p_Log_Key NUMBER;
    p_Result_Msg VARCHAR;
    p_Row_Count NUMBER;
    p_Params VARCHAR;
    p_Error_Msg VARCHAR(4000);
  BEGIN
    p_Step_Keys := OBJECT_KEYS(p_SQL_Steps); 
    FOR i IN 0 TO (ARRAY_SIZE(p_Step_Keys) - 1) DO
        p_Step_Cmd := p_SQL_Steps[p_Step_Keys[i]];
        p_Step_Code := p_Step_Keys[i];

        /* Get Session Variables */
        CALL GET_SESS_VARS() INTO :p_Params;
        /* Log Step START */
        CALL LOG_TASK (
          log_target_table_name => $map_target_table,
          log_target_bucket => $map_bucket,
          log_module_id => $map_module_id,
          log_step_id => :p_Step_Code,
          log_effective_date => $p_load_date,
          log_command => :p_Step_Cmd,
          log_params => :p_Params
          );
        /* Keboola bug - nelze použít INTO */
        SELECT OUT_RESULT INTO :p_Log_Key FROM PROCEDURE_LAST_RESULT;
        
        /* Execute Step */
        IF (NOT(p_Log_Only)) THEN
          EXECUTE IMMEDIATE (:p_Step_Cmd);
          CALL GET_LAST_SQL_ROWCOUNT () INTO :p_Row_Count;
        END IF;
        
        /* Log END of SQL Step */
        call LOG_TASK (
         log_key => :p_Log_Key,
         log_status => 'OK',
         log_cnt_rows => :p_Row_Count
          );
    END FOR;
    RETURN p_SQL_Steps;
 EXCEPTION
   WHEN OTHER THEN
     /* Log Error */
     p_Error_Msg := SQLERRM;
     CALL LOG_TASK (
         log_key => :p_Log_Key,
         log_message => :p_Error_Msg,
         log_status => 'ERROR'
  );
  RAISE;
  END;
$$
;

/********************************************** END: Procedure EXECUTE_CMD_STEPS***********************************/
