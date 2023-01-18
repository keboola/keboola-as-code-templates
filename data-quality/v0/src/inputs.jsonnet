{
  stepsGroups: [
    {
      description: "Generation of sample data.",
      required: "optional",
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
          description: "Data Quality Example",
          inputs: [],
        },
      ],
    },
  ],
}
