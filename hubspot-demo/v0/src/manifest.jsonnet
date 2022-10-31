{
  configurations: [
    {
      componentId: "kds-team.ex-hubspot-crm",
      id: ConfigId("data-source"),
      path: "extractor/kds-team.ex-hubspot-crm/data-source",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"in-crm-hubspot-extractor"}',
        "KBC.KAC.templates.configInputs": '[{"input":"ex-hubspot-crm-private-app-token","key":"parameters.#private_app_token"},{"input":"hubspot-auth-type","key":"parameters.authentication_type"},{"input":"ex-hubspot-crm-period-from","key":"parameters.period_from"}]',
        "KBC.KAC.templates.instanceId": "tUg2vr3PtQ1I17xWOkdBxVx5u",
        "KBC.KAC.templates.repository": "keboola",
        "KBC.KAC.templates.templateId": "hubspot-to-snowflake",
      },
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("flow"),
      path: "other/keboola.orchestrator/flow",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"keboola-crm-hubspot-orchestration"}',
        "KBC.KAC.templates.instanceId": "tUg2vr3PtQ1I17xWOkdBxVx5u",
        "KBC.KAC.templates.repository": "keboola",
        "KBC.KAC.templates.templateId": "hubspot-to-snowflake",
      },
      rows: [],
    },
    {
      componentId: "keboola.scheduler",
      id: ConfigId("scheduler-for-26767962"),
      path: "schedules/scheduler-for-26767962",
      relations: [
        {
          componentId: "keboola.orchestrator",
          configId: ConfigId("flow"),
          type: "schedulerFor",
        },
      ],
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation1-input-tables-creation"),
      path: "transformation/keboola.snowflake-transformation/transformation1-input-tables-creation",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"in-crm-hubspot-transformation1-input-tables-creation"}',
        "KBC.KAC.templates.instanceId": "tUg2vr3PtQ1I17xWOkdBxVx5u",
        "KBC.KAC.templates.repository": "keboola",
        "KBC.KAC.templates.templateId": "hubspot-to-snowflake",
        "KBC.configuration.folderName": "[CRM-HUBSPOT]",
      },
      rows: [],
    },
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation2-main"),
      path: "transformation/keboola.snowflake-transformation/transformation2-main",
      metadata: {
        "KBC.KAC.templates.configId": '{"idInTemplate":"in-crm-hubspot-transformation2-main"}',
        "KBC.KAC.templates.instanceId": "tUg2vr3PtQ1I17xWOkdBxVx5u",
        "KBC.KAC.templates.repository": "keboola",
        "KBC.KAC.templates.templateId": "hubspot-to-snowflake",
        "KBC.configuration.folderName": "[CRM-HUBSPOT]",
      },
      rows: [],
    },
  ],
}
