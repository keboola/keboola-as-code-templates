{
  parameters: {
    tokens: [],
    datasets: {
      get_tables_load_events: true,
      get_transformations: true,
      get_tokens: true,
      get_all_configurations: true,
      get_triggers: true,
      get_organization_users: true,
      get_tokens_last_events: true,
      get_tables: true,
      get_waiting_jobs: true,
      get_columns: true,
      get_project_users: true,
      get_transformations_v2: true,
      get_orchestrations: true,
      get_storage_buckets: true,
      get_workspace_load_events: true,
    },
    master_token: [
      {
        "#token": Input("ex-kbc-project-metadata-v2-master-token-0-token"),
        org_id: Input("ex-kbc-project-metadata-v2-master-token-0-org-id"),
        region: "current",
      },
    ],
    incremental_load: 0,
  },
}
