The flow, in a nutshell:
- Flow creates set of Shared Codes - Snowflake SQL procedures for data quality tests and test result logging
- Python transformation creates dummy datasets
- Finally, Snowflake SQL transformations use generated dummy datasets to demonstrate how to use the SQL procedures in your Snowflake SQL transformations
- Data quality tests produce a ```result log``` output table intended to be used for continuous monitoring of the results

Table Description: DQ RESULT LOG
| Column Name | Description | Sample value |
| :--- | :--- | ---: |
|ID|Unique identifier of performed test|1d8fb4e8c486829db3387e429e0cb8a0|
|EXECUTION_TIME|Timestamp of executed test|Mon, 23 Jan 2023 13:58:34 +0100|
|COMPONENT_ID|Component identifier|keboola.snowflake-transformation|
|CONFIGURATION_ID|Unique identifier of component configuration|943845068|
|RUN_ID|Run ID (from job log)|943845595|
|JOB_URL|Job URL|https://connection.keboola.com/admin/projects/9389/queue/943845595|
|TEST_ID|Identifier of the test|TEST_COLUMN_FOREIGN_REF|
|TEST_QUERY|Particular test query showing which attributes were used for the test|TEST_COLUMN_FOREIGN_REF('orders', 'customers', 'order_id', 'pk');|
|TEST_NAME|Name of the test|TEST_COLUMN_FOREIGN_REF|
|TEST_RESULT_VALUE|Result value - present if test fails. Shows what values offended the test.|[{"OCCURENCES":0,"OFFENDER":"61"}|
|TEST_PARAMETERS|Detail of TEST_QUERY parameters|{"TABLE_NAME_MAIN" :"orders", "COLUMN_NAME": "order_id", "TABLE_NAME_REF": "customers", "COLUMN_NAME_REF": "pk"}|
|TEST_RESULT|Result of test (success/error)|error|
|TEST_LEVEL|Level of test (WARNING/FAIL). Fail test level is intended to be used if users want to abort their transformation/flow right after such error fails.|WARNING|

