{
  parameters: {},
  storage: {
    input: {
      tables: [
        {
          source: "in.c-keboola-ex-github-" + ConfigId("data-source-in-git-github") + ".organizations",
          destination: "organizations",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-github-" + ConfigId("data-source-in-git-github") + ".members",
          destination: "members",
          where_column: "",
          where_values: [],
          where_operator: "eq",
          columns: [],
        },
        {
          source: "in.c-keboola-ex-github-" + ConfigId("data-source-in-git-github") + ".members_detail",
          destination: "members_detail",
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
          destination: "out.c-git-tr-" + InstanceIdShort() + ".organization",
          primary_key: [
            "organization_id",
          ],
          source: "out_organization",
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
  },
}
