{ mainConfig: {
    componentId: "keboola.python-transformation-v2",
    id: ConfigId("data-profiling"),
  },
  configurations: [
    {
      componentId: "keboola.python-transformation-v2",
      id: ConfigId("data-profiling"),
      path: "transformation/keboola.python-transformation-v2/data-profiling",
      rows: [],
    },
    {
      componentId: "keboola.variables",
      id: ConfigId("variables-definition-for-keboola-python-transformation-v2"),
      path: "variables",
      relations: [
        {
          componentId: "keboola.python-transformation-v2",
          configId: ConfigId("data-profiling"),
          type: "variablesFor",
        },
      ],
      rows: [
        {
          id: ConfigRowId("default-values"),
          path: "values/default-values",
          relations: [
            {
              type: "variablesValuesFor",
            },
          ],
        },
      ],
    },
  ],
}

