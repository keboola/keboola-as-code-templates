{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".activities",
          destination: "activities",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".deals",
          destination: "deals",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".organizations",
          destination: "organizations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".pipelines",
          destination: "pipelines",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".person_emails",
          destination: "person_emails",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".persons",
          destination: "persons",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".stages",
          destination: "stages",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-pipedrive-" + ConfigId("keboola-crm-pipedrive-data-source") + ".users",
          destination: "users",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
      ],
    },
    output: {
      tables: [
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".activities",
          source: "out_activities",
          primary_key: [
            "activity_id",
          ],
        },
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".deals",
          source: "out_deals",
          primary_key: [
            "deal_id",
          ],
        },
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".organizations",
          source: "out_organizations",
          primary_key: [
            "organization_id",
          ],
        },
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".persons",
          source: "out_persons",
          primary_key: [
            "contact_id",
          ],
        },
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".pipelines",
          source: "out_pipelines",
          primary_key: [
            "pipeline_id",
          ],
        },
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".stages",
          source: "out_stages",
          primary_key: [
            "stage_id",
          ],
        },
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".users",
          source: "out_users",
          primary_key: [
            "owner_id",
          ],
        },
        {
          destination: "in.c-crm-tr" + InstanceIdShort() + ".person_emails",
          source: "out_person_emails",
          primary_key: [
            "contact_id",
            "label",
          ],
        },
      ],
    },
  },
}
