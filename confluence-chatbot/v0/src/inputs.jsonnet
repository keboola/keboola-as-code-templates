{
  stepsGroups: [
    {
      description: "Data Source",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.ex-confluence",
          name: "Extraction",
          description: "Confluence - Data Source",
          dialogName: "Confluence Data Source", 
          dialogDescription: "Extract data from Confluence.",
          inputs: [
            {
              id: "ex-confluence-api-token",
              name: "API token",
              description: "API token of your Confluence account",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "ex-confluence-url",
              name: "Confluence URL",
              description: "Insert your Confluence URL.",
              type: "string",
              kind: "input",
              rules: "required",
              deafult: "https://myconfluencename.attlassian.net",
            },
            {
              id: "ex-confluence-username",
              name: "Username",
              description: "Insert your username.",
              type: "string",
              kind: "input",
              rules: "required",
            },
          ],
        },
      ],
     },
     {   
      description: "Python Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.python-transformation-v2",
          name: "Python",
          description: "Transformation",
          inputs: [],
        },
      ]
     },
     {
      description: "Data Destination",
      required: "all",
      steps: [
        {
          icon: "component:kds-team.wr-pinecone",
          name: "Data Destination",
          description: "Pinecone - Destination",
          dialogName: "Pinecone Destination", 
          dialogDescription: "Insert docs into Pinecone.",
          inputs: [
            {
              id: "wr-pinecone-authentication-openai-api-key",
              name: "OpenAI API Key",
              description: "OpenAI API Key that will be used to create embeddings.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "wr-pinecone-authentication-pinecone-api-key",
              name: "Pinecone Api Key",
              description: "API Key to authenticate into Pinecone.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "wr-pinecone-authentication-pinecone-environment",
              name: "Pinecone Environment",
              description: "Environment to authenticate into Pinecone",
              type: "string",
              kind: "input",
              rules: "required",
            },
          ],
        },
      ],
     },
     {
      description: "Data App",
      required: "all",
      steps: [
        {
          icon: "component:keboola.data-apps",
          name: "Data App",
          description: "Configure Data App",
          dialogName: "Confluence Chatbot", 
          dialogDescription: "Configure Data App by filling up required secrets.",
          inputs: [],
        },
      ],
    },
  ],
}
