{
  stepsGroups: [
    {
      description: "Question",
      required: "all",
      steps: [
        {
          icon: "common:settings",
          name: "Setup",
          description: "Set up Telemetry and Metadata",
          dialogName: "Telemetry and Metadata",
          dialogDescription: "To run the Metadata source component we need to know your storage token.",
          inputs: [
            {
              id: "ex-kbc-project-metadata-v2-tokens-0-key",
              name: "Storage Token",
              description: "Enter the storage token from your project.",
              type: "string",
              kind: "hidden",
              rules: "required"
            },
            {
              id: "metadata-folder",
              name: "Metadata Bucket",
              description: "Enter the bucket name of the Metadata source component.",
              type: "string",
              kind: "input",
              rules: "required",
              default: "kds-team-ex-kbc-project-metadata-v2-12345678",
              showif: "[ex-kbc-project-metadata-v2-tokens-0-key] == 'YES'",
            },
            {
              id: "telemetry-folder",
              name: "Telemetry Bucket",
              description: "Insert the bucket name of the data extracted from Telemetry.",
              type: "string",
              kind: "input",
              rules: "required",
              default: "keboola-ex-telemetry-data-12345678",
              showif: "[ex-kbc-project-metadata-v2-tokens-0-key] == 'YES'",
            },
          ],
        },
      ],
    },
    {
      description: "Source component",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-kbc-project-metadata-v2",
          name: "KBC Project Metadata",
          description: "Import KBC Project Metadata",
          dialogName: "KBC Project Metadata Source",
          dialogDescription: "This source component imports data about your Keboola project.",
          inputs: []
        },
        {
          icon: "component:keboola.ex-telemetry-data",
          name: "Telemetry Data",
          description: "Import Telemetry data",
          dialogName: "Telemetry Source",
          dialogDescription: "This source component imports data about your Keboola project.",
          inputs: [],
        },
      ],
    },
    {   
      description: "Snowflake Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake SQL",
          description: "Transformation",
          inputs: [],
        },
      ]
    },
    {
      description: "Destination Component",
      required: "all",
      steps: [
         {
          icon: "component:kds-team.app-datahub",
          name: "DataHub",
          description: "Load data into DataHub",
          dialogName: "DataHub destination", 
          dialogDescription: "This destination component loads your Telemetry data and metadata into DataHub.",
          inputs:[
            {
              id: "app-datahub-datahub-token",
              name: "DataHub Token",
              description: "Insert your DataHub Token",
              type: "string",
              kind: "hidden",
              rules: "required"
            },
            {
              id: "app-datahub-server-address",
              name: "DataHub server address",
              description: "Set URL or IP in format (http://IP:PORT)",
              type: "string",
              kind: "input",
              default: "URL",
            },
          ],
        },
      ]
    }
  ],
}

