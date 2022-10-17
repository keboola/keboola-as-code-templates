----------------------------------------------------------------------------------------------------------------
------------------------------------OUT_LATEST_CONFIGURATIONS-------------------------------------------------
----------------------------------------------------------------------------------------------------------------

CREATE TABLE 
    "out_latest_configurations" 
AS
SELECT "component_configuration_id", max("configuration_last_version") AS "configuration_last_version" FROM "configurations"
GROUP BY "component_configuration_id";