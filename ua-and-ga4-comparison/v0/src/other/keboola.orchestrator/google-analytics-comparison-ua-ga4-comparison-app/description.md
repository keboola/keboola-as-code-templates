This Flow downloads data from old and new Google Analytics, clean & transform them and deploy the Interactive Data App to compare them. It contains set of tasks that will be executed in a specific order. The tasks are: 

1. `keboola.ex-google-analytics-4`
2. `keboola.ex-google-analytics-UA`
3. `keboola.ex-google-bigquery`
4. `keboola.snowflake-transformation`
5. `keboola.data-apps`
