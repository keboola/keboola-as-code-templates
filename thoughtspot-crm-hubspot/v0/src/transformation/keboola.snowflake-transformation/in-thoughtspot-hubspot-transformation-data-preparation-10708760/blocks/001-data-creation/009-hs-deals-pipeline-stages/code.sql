-- HS_HUBSPOT."PUBLIC".HS_DEALS_PIPELINE_STAGES
CREATE TABLE HS_DEALS_PIPELINE_STAGES 
AS
SELECT DISTINCT
    CASE WHEN "active" = 'True' THEN 'False' ELSE 'True' END AS ARCHIVED,
    "probability" AS PROBABILITY,
    "pipelineId" AS PIPELINE_ID,
    "displayOrder" AS DISPLAY_ORDER,
    "stageId" AS ID,
    "label" AS LABEL,
    "closedWon" AS IS_CLOSED
FROM "pipeline_stages"
;
