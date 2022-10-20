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
          dialogDescription: "To run the Metadata source component we need to know your storage token or master token and organisation ID. It depend if you want to use this template on project or organization level.",
          inputs: [
            {
              id: "metadata-level",
              name: "Level of Metadata source",
              description: "Do you want to get data on project or organization level?",
              type: "string",
              kind: "select",
              rules: "required",
              options:[
                {
                  value: 'Project',
                  label:'Only for this Project'
                },
                {
                  value: 'Organization',
                  label:'For whole Organization'
                },
              ],
            },
            {
              id: "ex-kbc-project-metadata-v2-tokens-0-key",
              name: "Storage Token",
              description: "Enter the storage token from your project.",
              type: "string",
              kind: "hidden",
              rules: "required",
              showif: "[metadata-level] == 'Project'"
            },
            {
              id: "ex-kbc-project-metadata-v2-master-token-0-token",
              name: "Master Access Token",
              description: "Enter the management token for your organization.",
              type: "string",
              kind: "hidden",
              rules: "required",
              showif: "[metadata-level] == 'Organization'"
            },
            {
              id: "ex-kbc-project-metadata-v2-master-token-0-org-id",
              name: "Organization ID",
              description: "Organization ID is visible in URL on the organization page.",
              type: "string",
              kind: "input",
              default: "XXX",
              showif: "[metadata-level] == 'Organization'"
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
              description: "Enter the bucket name of the Telemetry source component.",
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
      description: "Destination component",
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
              description: "Enter your DataHub Token",
              type: "string",
              kind: "hidden",
              rules: "required"
            },
            {
              id: "app-datahub-server-address",
              name: "DataHub server address",
              description: "Enter URL or IP in the format of http://IP:PORT",
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

