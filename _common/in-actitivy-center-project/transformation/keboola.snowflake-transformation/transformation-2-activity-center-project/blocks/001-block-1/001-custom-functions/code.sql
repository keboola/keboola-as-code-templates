/*
 Converts timestamp in format TIMESTAMP_NTZ (used in telemetry) to string in format YYYY-MM-DD HH24:MI:SS TZH:TZM.
 Example: 2020-02-29 04:31:42 -> 2020-02-29 04:31:42 Z
 */
CREATE OR REPLACE FUNCTION convert_telemetry_timestamp(ts STRING)
    RETURNS STRING
AS
'
    IFF(ts = '''', NULL, TO_CHAR(CONVERT_TIMEZONE(''UTC'', ''UTC'', ts), ''YYYY-MM-DD HH24:MI:SS TZH:TZM''))
';

/*
 Converts a KBC timestamp in format YYYY-MM-DDTHH24:MI:SSTZHTZM to string in format YYYY-MM-DD HH24:MI:SS TZH:TZM.
 Example: 2020-02-29T06:31:42+0200 -> 2020-02-29 04:31:42 Z
 */
CREATE OR REPLACE FUNCTION convert_kbc_timestamp(ts STRING)
    RETURNS STRING
AS
'
    IFF(ts = '''', NULL,
        TO_CHAR(CONVERT_TIMEZONE(''UTC'', TO_TIMESTAMP_TZ(ts, ''YYYY-MM-DDTHH24:MI:SSTZHTZM'')),
                ''YYYY-MM-DD HH24:MI:SS TZH:TZM''))
';

/*
 Append regions suffix to a string from another string. The function utilizes SPLIT_PART().
 
 Parameters
 ----------
    s: a string, to which the region specifier will be appended
    region_specifier: a string, from which a region suffix will be extracted
    region_position: a position of region suffix in region_specifier string
 */
CREATE OR REPLACE FUNCTION append_region(s STRING, region_specifier STRING, region_position INTEGER)
    RETURNS STRING
AS
'
    CASE
        WHEN region_specifier IN (''us-east-1'', ''eu-central-1'')
            THEN CONCAT_WS(''-'', s, IFF(region_specifier = ''us-east-1'', ''US'', ''EU''))
        ELSE
            CONCAT_WS(''-'', S, SPLIT_PART(region_specifier, ''-'', region_position))
    END
';

CREATE OR REPLACE FUNCTION region_url(region_specifier STRING, region_position INTEGER)
    RETURNS STRING
AS
'
    CASE
        WHEN SPLIT_PART(region_specifier, ''-'', region_position) = ''EU'' OR region_specifier = ''eu-central-1''
            THEN ''https://connection.eu-central-1.keboola.com/''
        WHEN SPLIT_PART(region_specifier, ''-'', region_position) = ''US'' OR region_specifier = ''us-east-1''
            THEN ''https://connection.keboola.com/''
    END
';

SET current_ts = CONVERT_TIMEZONE('UTC', CURRENT_TIMESTAMP());
