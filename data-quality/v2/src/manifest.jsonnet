{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("data-quality-example")
  },
  configurations: [
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("data-quality-example"),
      path: "other/keboola.orchestrator/data-quality-example",
      rows: [],
    },
    {
      componentId: "keboola.shared-code",
      id: ConfigId("shared-code"),
      path: "_shared/keboola.snowflake-transformation",
      rows: [
        {
          id: ConfigRowId("data-quality-core"),
          path: "codes/data-quality-core",
        },
        {
          id: ConfigRowId("test-column-null"),
          path: "codes/test-column-null",
        },
        {
          id: ConfigRowId("test-column-null-or-empty"),
          path: "codes/test-column-null-or-empty",
        },
        {
          id: ConfigRowId("test-column-value-begin"),
          path: "codes/test-column-value-begin",
        },
        {
          id: ConfigRowId("test-column-value-contain"),
          path: "codes/test-column-value-contain",
        },
        {
          id: ConfigRowId("test-column-value-data-type"),
          path: "codes/test-column-value-data-type",
        },
        {
          id: ConfigRowId("test-column-value-end"),
          path: "codes/test-column-value-end",
        },
        {
          id: ConfigRowId("test-column-value-equal"),
          path: "codes/test-column-value-equal",
        },
        {
          id: ConfigRowId("test-column-value-greater-than"),
          path: "codes/test-column-value-greater-than",
        },
        {
          id: ConfigRowId("test-column-value-in-range"),
          path: "codes/test-column-value-in-range",
        },
        {
          id: ConfigRowId("test-column-value-in-set"),
          path: "codes/test-column-value-in-set",
        },
        {
          id: ConfigRowId("test-column-value-lower-than"),
          path: "codes/test-column-value-lower-than",
        },
        {
          id: ConfigRowId("test-column-value-matching-regexp"),
          path: "codes/test-column-value-matching-regexp",
        },
        {
          id: ConfigRowId("test-column-value-not-begin"),
          path: "codes/test-column-value-not-begin",
        },
        {
          id: ConfigRowId("test-column-value-not-contain"),
          path: "codes/test-column-value-not-contain",
        },
        {
          id: ConfigRowId("test-column-value-not-end"),
          path: "codes/test-column-value-not-end",
        },
        {
          id: ConfigRowId("test-column-value-not-equal"),
          path: "codes/test-column-value-not-equal",
        },
        {
          id: ConfigRowId("test-column-value-not-matching-regexp"),
          path: "codes/test-column-value-not-matching-regexp",
        },
        {
          id: ConfigRowId("test-column-values-unique"),
          path: "codes/test-column-values-unique",
        },
        {
          id: ConfigRowId("test-foreign-reference-column"),
          path: "codes/test-foreign-reference-column",
        },
        {
          id: ConfigRowId("test-numeric-anomaly"),
          path: "codes/test-numeric-anomaly",
        },
        {
          id: ConfigRowId("test-sum-in-groups-equal"),
          path: "codes/test-sum-in-groups-equal",
        },
        {
          id: ConfigRowId("test-table-compare-records"),
          path: "codes/test-table-compare-records",
        },
        {
          id: ConfigRowId("test-table-compare-structure"),
          path: "codes/test-table-compare-structure",
        },
        {
          id: ConfigRowId("test-table-empty"),
          path: "codes/test-table-empty",
        },
        {
          id: ConfigRowId("test-time-series-complete"),
          path: "codes/test-time-series-complete",
        },
        {
          id: ConfigRowId("test-time-series-complete-range"),
          path: "codes/test-time-series-complete-range",
        },
      ],
    },
    {
      componentId: "keboola.python-transformation-v2",
      id: ConfigId("generate-fake-data"),
      path: "transformation/keboola.python-transformation-v2/generate-fake-data",
      rows: [],
    },

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("data-quality-core-full-example"),
      path: "transformation/keboola.snowflake-transformation/data-quality-core-full-example",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("data-quality-core-full-example"),
      path: "transformation/keboola.google-bigquery-transformation/data-quality-core-full-example",
      rows: []
    
    {
      componentId: "keboola.variables",
      id: ConfigId("Variables definition for keboola.snowflake-transformation/913123604"),
      path: "variables",
      relations: [
        {
          componentId: "keboola.snowflake-transformation",
          configId: ConfigId("data-quality-core-full-example"),
          type: "variablesFor",
        },
      ],
      rows: [
        {
          id: ConfigRowId("default"),
          path: "values/default",
          relations: [
            {
              type: "variablesValuesFor",
            },
          ]
        }
      ],
    },

    if HasProjectBackend("snowflake") then {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("data-quality-abort-fail-example"),
      path: "transformation/keboola.snowflake-transformation/data-quality-abort-fail-example",
      rows: []
    } else if HasProjectBackend("bigquery") then {
      componentId: "keboola.google-bigquery-transformation",
      id: ConfigId("data-quality-abort-fail-example"),
      path: "transformation/keboola.google-bigquery-transformation/data-quality-abort-fail-example",
      rows: []
    
    {
      componentId: "keboola.variables",
      id: ConfigId("Variables definition for keboola.snowflake-transformation/913123605"),
      path: "variables",
      relations: [
        {
          componentId: "keboola.snowflake-transformation",
          configId: ConfigId("data-quality-abort-fail-example"),
          type: "variablesFor",
        },
      ],
      rows: [
        {
          id: ConfigRowId("default"),
          path: "values/default",
          relations: [
            {
              type: "variablesValuesFor",
            },
          ]
        }
      ],
    },
  ],
}
