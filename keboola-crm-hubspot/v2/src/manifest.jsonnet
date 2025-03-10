{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("keboola-crm-hubspot-orchestration"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("keboola-crm-hubspot-orchestration"),
      path: "other/keboola.orchestrator/keboola-crm-hubspot-orchestration",
      rows: [],
    },
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("in-crm-hubspot-extractor"),
      path: "<common>/in-crm-hubspot/v0/src/extractor/kds-team.ex-hubspot-crm/in-crm-hubspot-extractor",
      rows: [],
    },

	if HasProjectBackend("snowflake") then {
	  componentId: "keboola.snowflake-transformation",
	  id: ConfigId("in-crm-hubspot-transformation1-input-tables-creation"),
	  path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation1-input-tables-creation",
	  rows: [],
	  metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },

	} else if HasProjectBackend("bigquery") then {
	  componentId: "keboola.google-bigquery-transformation",
	  id: ConfigId("in-crm-hubspot-transformation1-input-tables-creation"),
	  path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.google-bigquery-transformation/in-crm-hubspot-transformation1-input-tables-creation",
	  rows: [],
	  metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },

	},

	if HasProjectBackend("snowflake") then {
	  componentId: "keboola.snowflake-transformation",
	  id: ConfigId("in-crm-hubspot-transformation2-main"),
	  path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation2-main",
	  rows: [],
	  metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },

	} else if HasProjectBackend("bigquery") then {
	  componentId: "keboola.google-bigquery-transformation",
	  id: ConfigId("in-crm-hubspot-transformation2-main"),
	  path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.google-bigquery-transformation/in-crm-hubspot-transformation2-main",
	  rows: [],
	  metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },

	},

	if HasProjectBackend("snowflake") then {
	  componentId: "keboola.snowflake-transformation",
	  id: ConfigId("in-crm-hubspot-transformation3-snapshots"),
	  path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.snowflake-transformation/in-crm-hubspot-transformation3-snapshots",
	  rows: [],
	  metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },

	} else if HasProjectBackend("bigquery") then {
	  componentId: "keboola.google-bigquery-transformation",
	  id: ConfigId("in-crm-hubspot-transformation3-snapshots"),
	  path: "<common>/in-crm-hubspot/v0/src/transformation/keboola.google-bigquery-transformation/in-crm-hubspot-transformation3-snapshots",
	  rows: [],
	  metadata: {
        "KBC.configuration.folderName": "[CRM-HUBSPOT]"
      },

	},
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("out-crm-gsheet-writer"),
      path: "<common>/out-crm-gsheet/v0/src/writer/keboola.wr-google-sheets/out-crm-gsheet-writer",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("out-crm-snowflake-writer"),
      path: "<common>/out-crm-snowflake/v0/src/writer/keboola.wr-snowflake/out-crm-snowflake-writer",
      rows: [
        {
          id: ConfigRowId("activity"),
          path: "rows/activity",
        },
        {
          id: ConfigRowId("company"),
          path: "rows/company",
        },
        {
          id: ConfigRowId("contact"),
          path: "rows/contact",
        },
        {
          id: ConfigRowId("employee"),
          path: "rows/employee",
        },
        {
          id: ConfigRowId("opportunity"),
          path: "rows/opportunity",
        },
        {
          id: ConfigRowId("opportunity-contact"),
          path: "rows/opportunity-contact",
        },
        {
          id: ConfigRowId("opportunity-snapshot"),
          path: "rows/opportunity-snapshot",
        },
      ],
    },
    if InputIsAvailable("wr-google-bigquery-v2-service-account-private-key") then
    {
      componentId: "keboola.wr-google-bigquery-v2",
      id: ConfigId("data-destination-out-crm-bigquery"),
      path: "<common>/out-crm-bigquery/v0/src/writer/keboola.wr-google-bigquery-v2/data-destination-out-crm-bigquery",
      rows: [
        {
          id: ConfigRowId("activity"),
          path: "rows/activity",
        },
        {
          id: ConfigRowId("company"),
          path: "rows/company",
        },
        {
          id: ConfigRowId("contact"),
          path: "rows/contact",
        },
        {
          id: ConfigRowId("employee"),
          path: "rows/employee",
        },
        {
          id: ConfigRowId("opportunity"),
          path: "rows/opportunity",
        },
        {
          id: ConfigRowId("opportunity-contact"),
          path: "rows/opportunity-contact",
        },
        {
          id: ConfigRowId("opportunity-snapshot"),
          path: "rows/opportunity-snapshot",
        },
      ],
    },
    if InputIsAvailable("wr-postgresql-db-hostname") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("out-crm-postgresql-writer"),
      path: "<common>/out-crm-postgresql/v0/src/writer/keboola.wr-db-pgsql/out-crm-postgresql-writer",
      rows: [
        {
          id: ConfigRowId("activity"),
          path: "rows/activity",
        },
        {
          id: ConfigRowId("company"),
          path: "rows/company",
        },
        {
          id: ConfigRowId("contact"),
          path: "rows/contact",
        },
        {
          id: ConfigRowId("employee"),
          path: "rows/employee",
        },
        {
          id: ConfigRowId("opportunity"),
          path: "rows/opportunity",
        },
        {
          id: ConfigRowId("opportunity-contact"),
          path: "rows/opportunity-contact",
        },
        {
          id: ConfigRowId("opportunity-snapshot"),
          path: "rows/opportunity-snapshot",
        },
      ],
    },
  ]),
}
