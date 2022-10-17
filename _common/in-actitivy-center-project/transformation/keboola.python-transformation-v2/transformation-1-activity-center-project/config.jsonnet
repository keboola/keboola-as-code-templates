{
    parameters: {
      packages: [
        "sqlparse",
        "https://bitbucket.org/kds_consulting_team/keboola-python-util-lib/get/0.2.9.zip#egg=kbc"
      ]
    },
    storage: {
        input: {
            tables: [
                {
                    source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2",
                    destination: "transformations.csv",
                    where_column: "",
                    where_values: [],
                    where_operator: "eq",
                    columns: []
                },
                {
                    source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2-inputs",
                    destination: "transformations-inputs.csv",
                    where_column: "",
                    where_values: [],
                    where_operator: "eq",
                    columns: []
                },
                {
                    source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2-outputs",
                    destination: "transformations-outputs.csv",
                    where_column: "",
                    where_values: [],
                    where_operator: "eq",
                    columns: []
                },
                {
                    source: "in.c-kds-team-ex-kbc-project-metadata-v2-" + ConfigId("metadata-activity-center-project") + ".transformations-v2-codes",
                    destination: "transformations-queries.csv",
                    where_column: "",
                    where_values: [],
                    where_operator: "eq",
                    columns: []
                }
            ]
        },
        output: {
            tables: [
                {
                    destination: "out.c-activity-center-project.analyser-inputs",
                    source: "analyzer-inputs.csv"
                }
            ]
        }
    },
    "runtime": {}
}

  