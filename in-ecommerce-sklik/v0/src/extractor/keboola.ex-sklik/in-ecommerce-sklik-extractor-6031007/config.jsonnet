{
  parameters: {
    "#token": Input("ex-sklik-token"),
    reports: [
      {
        name: "sklik-campaigns",
        resource: "campaigns",
        displayColumns: "id, name, clicks, impressions, totalMoney, createDate, budget.name, budget.name, startDate",
        displayOptions: '{ "statGranularity": "daily" }',
        restrictionFilter: '{ "dateFrom": "2020-01-01" }',
      },
      {
        name: "sklik-campaigns-monthly",
        resource: "campaigns",
        displayColumns: "id, name, clicks, impressions, totalMoney, createDate, budget.name, budget.name, startDate",
        displayOptions: '{ "statGranularity": "monthly" }',
        restrictionFilter: '{ "dateFrom": "2018-01-01" }',
      },
    ],
    accounts: Input("ex-sklik-accounts"),
    username: Input("ex-sklik-username"),
    "#password": Input("ex-sklik-password"),
  },
}
