{
  parameters: {
    "#token": Input("ex-sklik-token"),
    reports: [
      {
        name: "sklik-campaigns",
        resource: "campaigns",
        displayColumns: "id, name, clicks, impressions, totalMoney, createDate, budget.name, budget.name, startDate",
        displayOptions: '{ "statGranularity": "daily" }',
        restrictionFilter: '{ "dateFrom": "' + Input("ex-sklik-from-date-daily") + '", "dateTo": "' + Input("ex-sklik-to-date-daily") + '"}',
      },
      {
        name: "sklik-campaigns-monthly",
        resource: "campaigns",
        displayColumns: "id, name, clicks, impressions, totalMoney, createDate, budget.name, budget.name, startDate",
        displayOptions: '{ "statGranularity": "monthly" }',
        restrictionFilter: '{ "dateFrom": "' + Input("ex-sklik-from-date-monthly") + '"}',
      },
    ],
    accounts: Input("ex-sklik-accounts")
  },
}
