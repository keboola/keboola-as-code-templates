{
  parameters: {},
  storage: {
    output: {
      data_type_support: "authoritative",
      tables: [
        {
          destination: "out.c-git-tr-" + InstanceIdShort() + ".organization",
          source: "out_organization",
          primary_key: [
            "organization_id",
          ],
        },
        {
          destination: "out.c-git-bdm-" + InstanceIdShort() + ".organization_user",
          source: "out_organization_user",
          primary_key: [
            "organization_id",
            "user_id",
          ],
        },
        {
          destination: "out.c-git-tr-" + InstanceIdShort() + ".user",
          source: "out_user",
          primary_key: [
            "user_id",
          ],
        },
      ],
    },
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-github-" + ConfigId("data-source-in-git-github") + ".organizations",
          destination: "organizations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-keboola-ex-github-" + ConfigId("data-source-in-git-github") + ".members",
          destination: "members",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
        {
          source: "in.c-keboola-ex-github-" + ConfigId("data-source-in-git-github") + ".members_detail",
          destination: "members_detail",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
          keep_internal_timestamp_column: false,
        },
      ],
    },
  },
}
