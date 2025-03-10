{
  parameters: {
    "#token": Input("ex-sklik-token"),
    reports: [
      {
        name: "campaign",
        resource: "campaigns",
        displayColumns: "id, name, clicks, impressions, ctr, budget.dayBudget, createDate, deleteDate, startDate, endDate, totalBudget, clickMoney, totalMoney",
        displayOptions: '{ "statGranularity": "daily" }',
        restrictionFilter: '{ "dateFrom": "' + Input("ex-sklik-from-date-daily") + '", "dateTo": "' + Input("ex-sklik-to-date-daily") + '"} ',
      },
      {
        name: "ads",
        resource: "ads",
        displayColumns: "id, name, clicks, impressions, ctr, adStatus, group.id, avgCostPerView, group.createDate, group.deleteDate, campaign.id, campaign.name, campaign.startDate, campaign.totalBudgetFrom, clickMoney, impressionMoney, totalMoney, exhaustedBudget,  createDate, deleteDate, views, viewRate",
        displayOptions: '{ "statGranularity": "daily" } ',
        restrictionFilter: '{ "dateFrom": "' + Input("ex-sklik-from-date-daily") + '", "dateTo": "' + Input("ex-sklik-to-date-daily") + '"}',
      },
      {
        name: "groups",
        resource: "groups",
        displayColumns: "id, name, clicks, impressions, ctr, createDate",
        displayOptions: '{ "statGranularity": "daily" }',
        restrictionFilter: '{ "dateFrom": "' + Input("ex-sklik-from-date-daily") + '", "dateTo": "' + Input("ex-sklik-to-date-daily") + '"}',
      },
    ],
    accounts: Input("ex-sklik-accounts"),
  },
}
