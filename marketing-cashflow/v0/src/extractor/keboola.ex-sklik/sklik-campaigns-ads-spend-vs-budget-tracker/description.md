This configuration retrieves data from Sklik for campaigns, ads, and groups with daily granularity. It will output the following columns: 

- Campaigns: `id`, `name`, `clicks`, `impressions`, `ctr`, `budget.dayBudget`, `createDate`, `deleteDate`, `startDate`, `endDate`, `totalBudget`, `clickMoney`, `totalMoney`
- Ads: `id`, `name`, `clicks`, `impressions`, `ctr`, `adStatus`, `group.id`, `avgCostPerView`, `group.createDate`, `group.deleteDate`, `campaign.id`, `campaign.name`, `campaign.startDate`, `campaign.totalBudgetFrom`, `clickMoney`, `impressionMoney`, `totalMoney`, `exhaustedBudget`, `createDate`, `deleteDate`, `views`, `viewRate`
- Groups: `id`, `name`, `clicks`, `impressions`, `ctr`, `createDate`
