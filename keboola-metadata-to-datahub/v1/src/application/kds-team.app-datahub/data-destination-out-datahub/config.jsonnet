{
  storage: {
    input: {
      tables: std.filter(function(v) v != null,[
        {
          source: "out.c-datahub-"+InstanceIdShort()+".table-level-metadata",
          destination: "table-level-metadata.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        if InputIsAvailable("ex-kbc-project-metadata-v2-master-token-0-token") then
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center") + ".orchestrations_v2",
          destination: "orchestrations_v2.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
         if InputIsAvailable("ex-kbc-project-metadata-v2-tokens-0-key") then
        {
          source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".orchestrations_v2",
          destination: "orchestrations_v2.csv",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "out.c-datahub-"+InstanceIdShort()+".dataset_lineage",
          destination: "dataset_lineage.csv",
          where_column: "component_type",
          where_values: [
                        "other"
                    ],
          where_operator: "ne",
          columns: [],
          keep_internal_timestamp_column: false
        },
        {
          source: "out.c-datahub-"+InstanceIdShort()+".flow_tasks",
          destination: "datajob.csv",
          where_column: "config_component_type",
          where_values: [
                        "other"
                    ],
          where_operator: "ne",
          columns: [],
          keep_internal_timestamp_column: false
        },
      ],)
    },
  },
  parameters: {
    jobs: {
      tags: true,
      schema: true,
      properties: true,
      data_lineage: true,
    },
    tags: [
      "is_alias",
      "is_deprecated",
      "stage",
    ],
    deprecated_in: 90,
    "#datahub_token": Input("app-datahub-datahub-token"),
    server_address: Input("app-datahub-server-address"),
    exclude_dev_branch_data: true
  },
}
