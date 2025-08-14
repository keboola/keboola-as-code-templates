{
  stepsGroups: [
    {
      description: "Python Transformation",
      required: "all",
      steps: [
        {
          icon: "component:keboola.python-transformation-v2",
          name: "Data Profiling",
          description: "Transformation",
          dialogName: "Python Transformation", 
          dialogDescription: "A python transformation that is used to profile data from a selected table.",
          inputs: [
            {
              id: "openai-api-key",
              name: "OpenAI Api Key",
              description: "Insert your Api Key to your OpenAI account.",
              type: "string",
              kind: "hidden",
              rules: "required",
            },
            {
              id: "table-id",
              name: "Table ID",
              description: "The ID of table you want to use.",
              type: "string",
              kind: "input",
              rules: "required",
              deafult: "in.c-data-profiling.customers",
            },
            {
              id: "table-name",
              name: "Table Name",
              description: "The name of table you want to use.",
              type: "string",
              kind: "input",
              rules: "required",
            },
          ],
        },
      ],
    },
  ],
}
