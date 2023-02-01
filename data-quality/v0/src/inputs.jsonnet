{
  stepsGroups: [
    {
      description: "Generation of sample data.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.python-transformation-v2",
          name: "Python transformation",
          description: "Generate Sample Data",
          inputs: [],
        },
      ],
    },
    {
      description: "Example of data quality check",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake transformation",
          description: "Data Quality Core - Full Example",
          inputs: [],
        },
      ],
    },
    {
      description: "Example of transformation abort",
      required: "all",
      steps: [
        {
          icon: "component:keboola.snowflake-transformation",
          name: "Snowflake transformation",
          description: "Data Quality Core - ABORT/FAIL Example",
          inputs: [],
        },
      ],
    },
  ],
}
