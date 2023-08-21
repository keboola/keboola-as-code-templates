{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("flow-keboola-metadata-to-datahub"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow-keboola-metadata-to-datahub"),
      path: "other/keboola.orchestrator/flow-keboola-metadata-to-datahub",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-tokens-0-key") then
    {
      componentId: "kds-team.ex-kbc-project-metadata-v2",
      id: ConfigId("metadata-activity-center-project"),
      path: "<common>/in-actitivy-center-project/extractor/kds-team.ex-kbc-project-metadata-v2/metadata-activity-center-project",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-tokens-0-key") then
    {
      componentId: "keboola.ex-telemetry-data",
      id: ConfigId("telemetry-activity-center-project"),
      path: "<common>/in-actitivy-center-project/extractor/keboola.ex-telemetry-data/telemetry-activity-center-project",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-master-token-0-token") then
    {
      componentId: "kds-team.ex-kbc-project-metadata-v2",
      id: ConfigId("metadata-activity-center"),
      path: "<common>/in-activity-center/extractor/kds-team.ex-kbc-project-metadata-v2/metadata-activity-center",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-master-token-0-token") then
    {
      componentId: "keboola.ex-telemetry-data",
      id: ConfigId("telemetry-activity-center"),
      path: "<common>/in-activity-center/extractor/keboola.ex-telemetry-data/telemetry-activity-center",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-tokens-0-key") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-lineage-in-datahub-without-ex-project"),
      path: "transformation/keboola.snowflake-transformation/transformation-lineage-in-datahub-without-ex-project",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-tokens-0-key") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-table-level-metadata-in-datahub-without-ex-project"),
      path: "transformation/keboola.snowflake-transformation/transformation-table-level-metadata-in-datahub-without-ex-project",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-master-token-0-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-lineage-in-datahub-without-ex-org"),
      path: "transformation/keboola.snowflake-transformation/transformation-lineage-in-datahub-without-ex-org",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-master-token-0-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-table-level-metadata-in-datahub-without-ex-org"),
      path: "transformation/keboola.snowflake-transformation/transformation-table-level-metadata-in-datahub-without-ex-org",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-master-token-0-token") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-flow-lineage-in-datahub-without-ex-org"),
      path: "transformation/keboola.snowflake-transformation/transformation-flow-lineage-in-datahub-without-ex-org",
      rows: [],
    },
    if InputIsAvailable("ex-kbc-project-metadata-v2-tokens-0-key") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-flow-lineage-in-datahub-without-ex-project"),
      path: "transformation/keboola.snowflake-transformation/transformation-flow-lineage-in-datahub-without-ex-project",
      rows: [],
    },
    {
      componentId: "kds-team.app-datahub",
      id: ConfigId("data-destination-out-datahub"),
      path: "application/kds-team.app-datahub/data-destination-out-datahub",
      rows: [],
    },
  ],)
}
