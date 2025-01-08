-- SET TIMEZONE VARIABLE
SET CURR_TIMESTAMP = (SELECT CONVERT_TIMEZONE({{TIMEZONE}}, current_timestamp()))::TIMESTAMP_TZ;

-- CREATE LOG TABLE
CREATE OR REPLACE TABLE DQ_RESULTS_LOG (
    ID                STRING NOT NULL,
    EXECUTION_TIME    TIMESTAMP_TZ,
    COMPONENT_ID      STRING,
    CONFIGURATION_ID  STRING,
    RUN_ID            STRING,
    JOB_URL           STRING,
    TEST_ID           STRING,
    TEST_QUERY        STRING,
    TEST_NAME         STRING,
    TEST_RESULT_VALUE STRING,
    TEST_PARAMETERS   STRING,
    TEST_RESULT       STRING,
    TEST_LEVEL        STRING
);

// SETS VARIABLE THAT ABORTS ENTIRE TRANSFORMATION IF ANY FAIL TEST FOUND

CREATE OR REPLACE FUNCTION GET_LATEST_FAILED_MESSAGE()
    RETURNS STRING
AS
$$
    SELECT
        CASE
            WHEN ERROR IS NULL THEN ''
            ELSE ERROR
            END AS res
    FROM
            (SELECT 1 AS DUMMY) DUMMY
                LEFT JOIN (
            SELECT 'FAIL Level Data Quality test failed: ' || TEST_QUERY AS ERROR
            FROM DQ_RESULTS_LOG
            WHERE TEST_LEVEL = 'FAIL' AND TEST_RESULT = 'error'
            ORDER BY
                EXECUTION_TIME LIMIT 1) TEST
                          ON 1 = 1
    $$;

// Procedure collecting results of tests
// Test methods can be used separately also to look at the results directly
CREATE OR REPLACE PROCEDURE LOG_PREVIOUS_TEST_RESULT(LEVEL STRING)
returns STRING
language sql
EXECUTE AS CALLER
as
        $$
            declare
                insert_statement string;
                test_result string default 'SELECT ARRAY_AGG(object_construct(*))::STRING AS RES FROM table(result_scan(last_query_id()))';
                test_query string default 'select REPLACE(QUERY_TEXT,\'call \',\'\') from table(information_schema.query_history_by_session()) WHERE QUERY_ID = last_query_id()';
            BEGIN
                insert_statement := 'INSERT INTO DQ_RESULTS_LOG
                                    SELECT 
                                    MD5(CONCAT_WS(\'|\', last_query_id(), $KBC_CONFIGID, $KBC_RUNID, $KBC_PROJECTID, $KBC_STACKID)),
                                    $CURR_TIMESTAMP,
                                    $KBC_COMPONENTID AS COMPONENT_ID,
                                    $KBC_CONFIGID AS CONFIGURATION_ID,
                                    $KBC_RUNID AS RUN_ID,
                                    \'https://\' || $KBC_STACKID || \'/admin/projects/\' || $KBC_PROJECTID || \'/queue/\' || $KBC_RUNID  AS JOB_URL,
                                    SPLIT_PART(('|| :test_query ||'), \'(\', 0) AS TEST_ID,
                                    ('|| :test_query ||') as TEST_QUERY,
                                    SPLIT_PART(TEST_QUERY, \'(\', 0) AS TEST_NAME,
                                    (' || :test_result|| ') AS TEST_RESULT_VALUE,
                                    $DQ_LAST_PARAMETERS AS TEST_PARAMETERS,
                                    IFF(TEST_RESULT_VALUE =\'[]\', \'success\', \'error\') AS TEST_RESULT,
                                    \''|| :LEVEL|| '\' AS TEST_LEVEL';

                execute immediate :insert_statement;

            END;
        $$;

// Procedure that records last test parameters
// It is used by every TEST_* procedure and the session variable DQ_LAST_PARAMETERS is used in LOG_TEST RESULT
CREATE OR REPLACE PROCEDURE DQ_STORE_LAST_QUERY_PARAMETERS(PARAMS STRING)
returns string
language sql
EXECUTE AS CALLER
as
$$
begin
 execute immediate 'SET DQ_LAST_PARAMETERS = (SELECT \''|| :PARAMS ||'\')';
end
$$;

// TEST DEFINITIONS
// functions of particulat tests

// Tests whether all records within given set of columns in given table are unique. Fails when there is more than 0 duplicate records.
CREATE OR REPLACE PROCEDURE TEST_COLUMN_UNIQUE(TABLE_NAME STRING, COLUMN_NAME STRING)
returns table(OFFENDERS TEXT, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
                parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\", \"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\"::TEXT AS OFFENDER, COUNT(\"' || :COLUMN_NAME ||'\") AS OCCURRENCES FROM \"'|| :TABLE_NAME || '\" GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURRENCES >1';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table(res);
            END;
        $$;

// Tests for presence of Null or Empty '' values in a given column in given table. Fails when there is more than 0 null values.        
CREATE OR REPLACE PROCEDURE TEST_COLUMN_NULL_OR_EMPTY(TABLE_NAME STRING, COLUMN_NAME STRING)
returns table(OFFENDERS varchar, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            		parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\", \"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\"::varchar AS OFFENDER, SUM(IFF(NULLIF(\"' || :COLUMN_NAME || '\"::varchar,'''') IS NULL, 1, 0)) AS OCCURRENCES
                 FROM \"' || :TABLE_NAME || '\" GROUP BY \"' || :COLUMN_NAME ||'\" HAVING OCCURRENCES > 0';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests for presence of Null values in a given column in given table. Fails when there is more than 0 null values.
CREATE OR REPLACE PROCEDURE TEST_COLUMN_NULL(TABLE_NAME STRING, COLUMN_NAME STRING)
returns table(OFFENDERS varchar, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            		parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\", \"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" AS OFFENDER, SUM(IFF(\"' || :COLUMN_NAME || '\" IS NULL, 1, 0)) AS OCCURRENCES
                 FROM \"' || :TABLE_NAME || '\" GROUP BY \"' || :COLUMN_NAME ||'\" HAVING OCCURRENCES > 0';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether there are more than X (optional parameter, default 0) records in table for each datepart (day, hour, …) in time series defined by date column. Fails when there are dates with less records than expected.
CREATE OR REPLACE PROCEDURE TEST_TIME_SERIES_COMPLETE(TABLE_NAME STRING, COLUMN_NAME STRING, MIN_CNT STRING)
returns table(OFFENDERS DATE, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            		parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\", \"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\"}';
                res resultset;
                query_dd varchar default 'CREATE OR REPLACE TABLE \"KBDQ_DATEDIM\" AS
                                          WITH date_dim AS (SELECT CURRENT_DATE-1 date_id), DATE_RANGE AS
                                          (SELECT date_id, DATEADD(DAY, -1*SEQ4(), date_dim.date_id) AS KBDQ_EFFECTIVE_DATE
                                           FROM date_dim, TABLE(GENERATOR(ROWCOUNT => (730))))
                                        SELECT KBDQ_EFFECTIVE_DATE FROM DATE_RANGE';
                query varchar default 'SELECT \"dd\".KBDQ_EFFECTIVE_DATE AS OFFENDER, COUNT(\"t\".\"' || :COLUMN_NAME || '\")  AS OCCURENCES
                                        FROM KBDQ_DATEDIM \"dd\" LEFT JOIN \"' || :TABLE_NAME || '\" \"t\" ON \"dd\".KBDQ_EFFECTIVE_DATE = \"t\".\"' || :COLUMN_NAME || '\"::date
                                        GROUP BY \"dd\".KBDQ_EFFECTIVE_DATE HAVING OCCURENCES < ' || :MIN_CNT ||'::number ORDER BY 1';
                query_drop varchar default 'DROP TABLE \"KBDQ_DATEDIM\"';
            BEGIN
                execute immediate :query_dd;
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                execute immediate :query_drop;
                return table (res);
            END;
        $$;

// Tests if there are more than MIN_CNT records in table TABLE_NAME based on date column COLUMN_NAME (tests range from DATE_MIN to DATE_MAX)
CREATE OR REPLACE PROCEDURE TEST_TIME_SERIES_COMPLETE_RANGE(TABLE_NAME STRING, COLUMN_NAME STRING,
                                                            MIN_CNT STRING, DATE_MIN DATE,
                                                            DATE_MAX DATE)
returns table(OFFENDERS DATE, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"MIN_CNT\": \"'|| :MIN_CNT || '\",\"DATE_MIN\": \"'|| :DATE_MIN || '\",\"DATE_MAX\": \"'|| :DATE_MAX || '\"}';
                res resultset;
                param_dd varchar default 'SET RN = (SELECT DATEDIFF(day, ''' || :DATE_MIN || ''', '''|| :DATE_MAX || ''')::number)';
                query_dd varchar default 'CREATE OR REPLACE TABLE \"KBDQ_DATEDIM\" AS
                                          WITH date_dim AS (SELECT ''' || :DATE_MAX || '''::date date_id), DATE_RANGE AS
                                          (SELECT date_id, DATEADD(DAY, -1*SEQ4(), date_dim.date_id) AS KBDQ_EFFECTIVE_DATE
                                           FROM date_dim, TABLE(GENERATOR(ROWCOUNT => ($RN))))
                                            SELECT KBDQ_EFFECTIVE_DATE FROM DATE_RANGE';
                query varchar default 'SELECT \"dd\".KBDQ_EFFECTIVE_DATE AS OFFENDER, COUNT(\"t\".\"' || :COLUMN_NAME || '\")  AS OCCURENCES
                                        FROM KBDQ_DATEDIM \"dd\" LEFT JOIN \"' || :TABLE_NAME || '\" \"t\" ON \"dd\".KBDQ_EFFECTIVE_DATE = \"t\".\"' || :COLUMN_NAME || '\"::date
                                        GROUP BY \"dd\".KBDQ_EFFECTIVE_DATE HAVING OCCURENCES < ' || :MIN_CNT ||'::number ORDER BY 1';
                query_drop varchar default 'DROP TABLE \"KBDQ_DATEDIM\"';                                        
            BEGIN
                execute immediate :param_dd;
                execute immediate :query_dd;
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                execute immediate :query_drop;                
                return table (res);
            END;
        $$;

// Tests whether each record’s reference key in table matched a reference record in given reference table. Fails when there is more than 0 records with no match. 
CREATE OR REPLACE PROCEDURE TEST_COLUMN_FOREIGN_REF(TABLE_NAME_MAIN STRING, TABLE_NAME_REF STRING,
                                                    COLUMN_NAME STRING, COLUMN_NAME_REF STRING)
returns table(OFFENDERS VARCHAR, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            		parameters string default '{\"TABLE_NAME_MAIN\" :\"'|| :TABLE_NAME_MAIN ||'\", \"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\", \"TABLE_NAME_REF\": \"'|| :TABLE_NAME_REF || '\", \"COLUMN_NAME_REF\": \"'|| :COLUMN_NAME_REF || '\"}';
                res resultset;
                query varchar default 'SELECT 
                            \"t\".\"' || :COLUMN_NAME || '\" AS OFFENDER,
                            SUM(IFF(\"r\".\"' || :COLUMN_NAME_REF || '\" IS NULL, 0, 1)) AS OCCURENCES
                        FROM \"' || :TABLE_NAME_MAIN || '\" \"t\"
                        LEFT JOIN \"' || :TABLE_NAME_REF || '\" \"r\"
                            ON \"t\".\"' || :COLUMN_NAME || '\" = \"r\".\"' || :COLUMN_NAME_REF || '\"
                        GROUP BY \"t\".\"' || :COLUMN_NAME || '\"
                        HAVING OCCURENCES < 1';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table contains provided string. Fails when value doesn’t contain given string.
CREATE OR REPLACE PROCEDURE TEST_VALUE_CONTAIN(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" NOT LIKE ''%' || :VALUE || '%'' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Opposite of test_value_cointains. Fails when value DOES contain the provided string.
CREATE OR REPLACE PROCEDURE TEST_VALUE_NOT_CONTAIN(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" LIKE ''%' || :VALUE || '%'' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether sum of values in given column in a group (optional) in a table is equal in two tables (groups in both tables can differ). Fails when sum differs by more than 0.
CREATE OR REPLACE PROCEDURE TEST_SUM_IN_GROUPS_EQUAL(TABLE_NAME_MAIN STRING, COLUMN_NAME_MAIN STRING, GROUP_COLUMN_MAIN STRING, 
                                                     TABLE_NAME_SEC STRING, COLUMN_NAME_SEC STRING, GROUP_COLUMN_SEC STRING)
returns table()
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME_MAIN\" :\"'|| :TABLE_NAME_MAIN ||'\",\"COLUMN_NAME_MAIN\": \"'|| :COLUMN_NAME_MAIN || '\",\"GROUP_COLUMN_MAIN\": \"'|| :GROUP_COLUMN_MAIN || '\",\"TABLE_NAME_SEC\": \"'|| :TABLE_NAME_SEC || '\",\"COLUMN_NAME_SEC\": \"'|| :COLUMN_NAME_SEC || '\",\"COLUMN_NAME_SEC\": \"'|| :GROUP_COLUMN_SEC || '\"}';
                res resultset;
                sum_main varchar default 'CREATE OR REPLACE TABLE SUM_MAIN AS SELECT \"' || :GROUP_COLUMN_MAIN || '\", SUM(\"' || COLUMN_NAME_MAIN || '\") AS sum_main FROM \"' || :TABLE_NAME_MAIN || '\" GROUP BY \"' || :GROUP_COLUMN_MAIN || '\"';
                sum_sec varchar default 'CREATE OR REPLACE TABLE SUM_SEC AS SELECT \"' || :GROUP_COLUMN_SEC || '\", SUM(\"' || COLUMN_NAME_SEC || '\") AS sum_sec FROM \"' || :TABLE_NAME_SEC || '\" GROUP BY \"' || :GROUP_COLUMN_SEC || '\"';
                query varchar default 'SELECT SUM_MAIN.\"' || :GROUP_COLUMN_MAIN || '\" AS GROUP_NAME, (SUM_MAIN.SUM_MAIN - SUM_SEC.SUM_SEC) AS DIFFERENCE FROM SUM_MAIN LEFT JOIN SUM_SEC ON SUM_MAIN.\"' || :GROUP_COLUMN_MAIN || '\" = SUM_SEC.\"' || :GROUP_COLUMN_SEC || '\" WHERE SUM_MAIN.SUM_MAIN != SUM_SEC.SUM_SEC  OR DIFFERENCE IS NULL';
                query_sum_main_drop varchar default 'DROP TABLE SUM_MAIN';
                query_sum_sec_drop varchar default 'DROP TABLE SUM_SEC';                
            BEGIN
                execute immediate :sum_main;
                execute immediate :sum_sec;
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                execute immediate :query_sum_main_drop;
                execute immediate :query_sum_sec_drop;
                return table (res);
            END;
        $$;

// Tests values in table numeric column that can be considered an anomaly (differs from average value by more than 2.5x standard deviation)
CREATE OR REPLACE PROCEDURE TEST_ANOMALY_NUMERIC(TABLE_NAME STRING, COLUMN_NAME STRING, COLUMN_ID STRING)
returns table()
language sql
EXECUTE AS CALLER
    as
        $$
            declare
                parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\", \"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\"}';
                res resultset;
                query_stat varchar default 'CREATE OR REPLACE TABLE \"DQ_CORE_ANOMALY_STATS\" AS SELECT STDDEV(\"' || :COLUMN_NAME || '\") AS \"VALUE_STD\", AVG(\"' || :COLUMN_NAME || '\") AS \"VALUE_AVG\" FROM \"' || :TABLE_NAME || '\"';
                query varchar default 'SELECT \"t\".\"' || :COLUMN_ID || '\", \"t\".\"' || :COLUMN_NAME || '\" FROM \"' || :TABLE_NAME || '\" \"t\" LEFT JOIN \"DQ_CORE_ANOMALY_STATS\" \"s\" ON 1=1 WHERE (\"t\".\"' || :COLUMN_NAME || '\" - \"s\".\"VALUE_AVG\") > 2.5 * \"s\".\"VALUE_STD\"';
                query_stat_drop varchar default 'DROP TABLE DQ_CORE_ANOMALY_STATS';
            BEGIN
                execute immediate :query_stat;
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                execute immediate :query_stat_drop;
                return table(res);
            END;
        $$;

// Tests whether value in given column in given table begins with provided string. Fails when value doesn’t contain given string.
CREATE OR REPLACE PROCEDURE TEST_VALUE_BEGIN(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" NOT LIKE ''' || :VALUE || '%'' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table doesnt begin with provided string. Fails when value doesn’t contain given string.
CREATE OR REPLACE PROCEDURE TEST_VALUE_NOT_BEGIN(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" LIKE ''' || :VALUE || '%'' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table ends with provided string. Fails when value doesn’t contain given string.
CREATE OR REPLACE PROCEDURE TEST_VALUE_END(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" NOT LIKE ''%' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table doesn't end with provided string. Fails when value doesn’t contain given string.
CREATE OR REPLACE PROCEDURE TEST_VALUE_NOT_END(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" LIKE ''%' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table matches with provided regexp.
CREATE OR REPLACE PROCEDURE TEST_VALUE_REGEXP(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" NOT REGEXP ''' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table does not match with provided regexp.
CREATE OR REPLACE PROCEDURE TEST_VALUE_NOT_REGEXP(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" REGEXP ''' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests structure of two tables. Fails when different
CREATE OR REPLACE PROCEDURE TEST_TABLE_COMPARE_STRUCTURE(TABLE1_NAME STRING, TABLE2_NAME STRING)
returns table()
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE1_NAME\" :\"'|| :TABLE1_NAME ||'\",\"TABLE2_NAME\": \"'|| :TABLE2_NAME || '\"}';
                res resultset;
                query varchar default 'SELECT DISTINCT \'MISSING IN TABLE2\' AS \"ISSUE\", COLUMN_NAME || \'__\' || DATA_TYPE AS \"COLUMN_NAME\" FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = \'' || :TABLE1_NAME || '\'   
MINUS 
SELECT DISTINCT \'MISSING IN TABLE2\' AS \"ISSUE\", COLUMN_NAME || \'__\' || DATA_TYPE AS \"COLUMN_NAME\" FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = \'' || :TABLE2_NAME || '\' 
UNION ALL
SELECT DISTINCT \'MISSING IN TABLE1\' AS \"ISSUE\", COLUMN_NAME || \'__\' || DATA_TYPE AS \"COLUMN_NAME\" FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = \'' || :TABLE2_NAME || '\' 
MINUS 
SELECT DISTINCT \'MISSING IN TABLE1\' AS \"ISSUE\", COLUMN_NAME || \'__\' || DATA_TYPE AS \"COLUMN_NAME\" FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = \'' || :TABLE1_NAME || '\'';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests table is not empty. Fails if empty
CREATE OR REPLACE PROCEDURE TEST_TABLE_EMPTY(TABLE_NAME STRING)
returns table()
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\"}';
                res resultset;
                query_prep varchar default 'CREATE OR REPLACE TABLE DQCORE__TABLE_EMPTY AS SELECT COUNT(*) AS CNT FROM \"' || :TABLE_NAME || '\"';
                query varchar default 'SELECT CNT FROM DQCORE__TABLE_EMPTY WHERE CNT=0';
                query_drop varchar default 'DROP TABLE DQCORE__TABLE_EMPTY';
            BEGIN
                execute immediate :query_prep;
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                execute immediate query_drop;
                return table (res);
            END;
        $$;

// Tests records of two tables. Fails when different
CREATE OR REPLACE PROCEDURE TEST_TABLE_COMPARE_RECORDS(TABLE1_NAME STRING, TABLE2_NAME STRING)
returns table()
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE1_NAME\" :\"'|| :TABLE1_NAME ||'\",\"TABLE2_NAME\": \"'|| :TABLE2_NAME || '\"}';
                res resultset;
                query varchar default 'SELECT \'MISSING IN TABLE 2\' AS \"ISSUE\", *
FROM \"' || :TABLE1_NAME || '\" 
MINUS
SELECT \'MISSING IN TABLE 2\' AS \"ISSUE\", *
FROM \"' || :TABLE2_NAME || '\" 
UNION ALL 
SELECT \'MISSING IN TABLE 1\' AS \"ISSUE\", *
FROM \"' || :TABLE2_NAME || '\" 
MINUS
SELECT \'MISSING IN TABLE 1\' AS \"ISSUE\", *
FROM \"' || :TABLE1_NAME || '\"';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests data type of provided column in provided table. Fails when different than expected.
CREATE OR REPLACE PROCEDURE TEST_COLUMN_VALUE_DATA_TYPE(TABLE_NAME STRING, COLUMN_NAME STRING, EXPECTED_DATA_TYPE STRING)
returns table()
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\", \"EXPECTED_DATA_TYPE\": \"'|| :EXPECTED_DATA_TYPE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\"  FROM \"' || :TABLE_NAME || '\" WHERE TRY_CAST(\"' || :COLUMN_NAME || '\" AS ' || :EXPECTED_DATA_TYPE || ') IS NULL';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table is equal with provided string. Fails if not equal.
CREATE OR REPLACE PROCEDURE TEST_VALUE_EQUAL(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" != ''' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether value in given column in given table is equal with provided string. Fails if equal.
CREATE OR REPLACE PROCEDURE TEST_VALUE_NOT_EQUAL(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" = ''' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests that each value in given column in given table is greater than provided value. Fails when value is NOT greater than the provided value.
CREATE OR REPLACE PROCEDURE TEST_VALUE_GREATER_THAN(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" <= ''' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests that each value in given column in given table is lower than provided value. Fails when value is NOT lower than the provided value.
CREATE OR REPLACE PROCEDURE TEST_VALUE_LOWER_THAN(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\",\"VALUE\": \"'|| :VALUE || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" >= ''' || :VALUE || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests that each value in given column in given table is between two provided values. Fails when value is NOT in given range.
CREATE OR REPLACE PROCEDURE TEST_VALUE_IN_RANGE(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE_LOW STRING, VALUE_HIGH STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\", \"VALUE_LOW\": \"'|| :VALUE_LOW || '\", \"VALUE_HIGH\": \"'|| :VALUE_HIGH || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" NOT BETWEEN ''' || :VALUE_LOW || ''' AND ''' || :VALUE_HIGH || ''' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;

// Tests whether all values in given column in given table are in provided set of values.Fails when value is not in provided set of values.
CREATE OR REPLACE PROCEDURE TEST_VALUE_IN_SET(TABLE_NAME STRING, COLUMN_NAME STRING, VALUE_SET STRING)
returns table(OFFENDERS STRING, OCCURRENCES INT)
language sql
EXECUTE AS CALLER
    as
        $$
            declare
            	parameters string default '{\"TABLE_NAME\" :\"'|| :TABLE_NAME ||'\",\"COLUMN_NAME\": \"'|| :COLUMN_NAME || '\"}';
                res resultset;
                query varchar default 'SELECT \"' || :COLUMN_NAME || '\" OFFENDER, COUNT(\"' || :COLUMN_NAME || '\")  AS OCCURENCES
 FROM \"' || :TABLE_NAME || '\" WHERE \"' || :COLUMN_NAME || '\" NOT IN ' || :VALUE_SET || ' GROUP BY \"' || :COLUMN_NAME || '\" HAVING OCCURENCES > 0 ';
            BEGIN
                res := (execute immediate :query);
                execute immediate 'CALL DQ_STORE_LAST_QUERY_PARAMETERS(\''|| :parameters ||'\')';
                return table (res);
            END;
        $$;
