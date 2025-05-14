{
  stepsGroups: [
    {
      description: "Default Group",
      required: "all",
      steps: [
        {
          icon: "common:settings",
          name: "Default Step",
          description: "Default Step",
          inputs: [
            {
              id: "keboola-url",
              name: "Keboola URL",
              description: "URL for stack e.g. connection.europe-west3.gcp.keboola.com",
              type: "string",
              kind: "input",
            },
            {
              id: "app-custom-python-user-properties-storage-api-token",
              name: "Storage API Token",
              description: "Token for the project you want to create the table in.",
              type: "string",
              kind: "hidden",
            },
            {
              id: "bucket-id",
              name: "Bucket ID",
              description: "ID for the bucket you want to create the table in.",
              type: "string",
              kind: "input",
            },
            {
              id: "table-name",
              name: "Table Name",
              description: "Name of the table you want to create.",
              type: "string",
              kind: "input",
            },
            {
              id: "pk-column-name",
              name: "Primary Key Column Name",
              description: "Name of the primary key column, cannot have any NULL values.",
              type: "string",
              kind: "input",
            },
            {
              id: "pk-column-type",
              name: "Primary Key Column Type",
              description: "Data type of primary key column.",
              type: "string",
              kind: "input",
            },
            {
              id: "partition-column-name",
              name: "Partitioning Column Name",
              description: "Name of the column that will be the time partitioned.",
              type: "string",
              kind: "input",
            },
            {
              id: "partition-column-type",
              name: "Partitioning Column Type",
              description: "Data type of the column that will be time partitioned.",
              type: "string",
              kind: "select",
              default: "TIMESTAMP",
              options: [
                {
                  value: "TIMESTAMP",
                  label: "TIMESTAMP",
                },
                {
                  value: "DATE",
                  label: "DATE",
                }
              ]
            },
            {
              id: "partitioning-type",
              name: "Time Partition Method",
              description: "Method/granularity of time partitioning.",
              type: "string",
              kind: "select",
              default: "MONTH",
              options: [
                {
                  value: "HOUR",
                  label: "HOUR",
                },
                {
                  value: "DAY",
                  label: "DAY",
                },
                {
                  value: "MONTH",
                  label: "MONTH",
                },
                {
                  value: "YEAR",
                  label: "YEAR",
                }
              ]
            }
          ]
        }
      ]
    }
  ]
}