# keboola-as-code-templates
Templates repository for [Keboola as Code CLI client](https://github.com/keboola/keboola-as-code/)

## How to Create a Template
To create a new template, follow these steps:
- Review the documentation in the `/developers-docs/cli/templates` folder. The `tutorial` subfolder provides step-by-step guidance, the `structure` folder outlines the required file and folder layout, and the `tests` folder includes tests to validate your template.
- Create a new folder under `/templates` with a unique identifier. This folder name will serve as the template's ID.
- Add a configuration file that includes the template's name, a clear description, and version details.
- Specify the supported backend(s) (e.g., snowflake) and list all required components.
- Follow the naming conventions and structure outlined in the documentation.

## Available Templates
Below is a list of available non-deprecated templates extracted from the repository. For each template, key details are provided:

### Template: Shopify Analytics for Thoughtspot
- **Description:** Combine data from Shopify and any of the included ad platforms to get a complete view of your e-commerce business with ready-to-go analytics in Thoughtspot.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-shopify, keboola.ex-facebook-ads, keboola.ex-google-ads, keboola.ex-sklik, keboola.wr-thoughtspot, keboola.wr-google-bigquery-v2, <keboola.wr-snowflake>
- **Version:** 1.0.0
- **Folder Location:** `thoughtspot-ecommerce-shopify`

### Template: JIRA Project Management
- **Description:** Aggregate all your JIRA data to dramatically improve team collaboration and work management.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-jira, keboola.wr-google-bigquery-v2, keboola.wr-google-sheets, <keboola.wr-snowflake>, keboola.wr-db-pgsql
- **Version:** 1.0.0
- **Folder Location:** `keboola-mgmt-jira`

### Template: Keboola's Project Metadata to DataHub
- **Description:** Aggregate telemetry data and project metadata to gain valuable insights and improve data governance.
- **Backend Support:** snowflake
- **Included Components:** keboola.ex-telemetry-data, kds-team.ex-kbc-project-metadata-v2, kds-team.app-datahub
- **Version:** 1.0.1
- **Folder Location:** `keboola-metadata-to-datahub`

### Template: Shopify DEMO Data Analysis
- **Description:** Check aggregations of Shopify DEMO DATA for insights on inventory optimization, product performance, and sales campaigns.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-shopify, keboola.ex-facebook-ads, keboola.ex-google-ads, keboola.ex-sklik, <keboola.wr-snowflake>
- **Version:** 1.0.0
- **Folder Location:** `snowflake-virtual-hands-on-lab`

### Template: Keboola dbt Tutorial
- **Description:** Run your first data pipeline with dbt! Extract seed data, model it with dbt, and export to your desired database.
- **Backend Support:** snowflake
- **Included Components:** keboola.ex-http, keboola.dbt-transformation, keboola.wr-db-mssql-v2, keboola.wr-db-mysql, keboola.wr-db-pgsql, keboola.wr-google-bigquery-v2, <keboola.wr-snowflake>
- **Version:** 1.0.0
- **Folder Location:** `keboola-dbt-tutorial`

### Template: Hands on Data Quality
- **Description:** Take a look at data quality testing and monitoring via two examples.
- **Backend Support:** snowflake
- **Included Components:** keboola.snowflake-transformation
- **Version:** 1.0.0
- **Folder Location:** `data-quality`

### Template: Social Media Engagement
- **Description:** Get your aggregated engagement data from various social networks.
- **Backend Support:** snowflake
- **Included Components:** keboola.ex-facebook, keboola.ex-instagram, keboola.ex-youtube, keboola.wr-db-mysql, keboola.wr-db-pgsql, keboola.wr-google-sheets, <keboola.wr-snowflake>, keboola.wr-google-bigquery-v2, kds-team.ex-linkedin-pages
- **Version:** 1.0.0 / 2.0.0
- **Folder Location:** `social-media-engagement-template`

### Template: CRM Pipedrive
- **Description:** Aggregate Pipedrive data to get more qualified leads and grow your business.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-pipedrive, keboola.wr-google-bigquery-v2, keboola.wr-google-sheets, <keboola.wr-snowflake>, keboola.wr-db-pgsql
- **Version:** 1.0.0
- **Folder Location:** `keboola-crm-pipedrive`

### Template: CRM Salesforce
- **Description:** Aggregate Salesforce data to better connect with your customers and partners.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-salesforce-v2, keboola.wr-google-sheets, keboola.wr-google-bigquery-v2, <keboola.wr-snowflake>, keboola.wr-db-pgsql
- **Version:** 1.0.0
- **Folder Location:** `keboola-crm-salesforce`

### Template: Git GitHub
- **Description:** Aggregate GitHub data to successfully manage your team and enhance security.
- **Backend Support:** snowflake, bigquery
- **Included Components:** keboola.ex-github, keboola.wr-google-bigquery-v2, keboola.wr-google-sheets, keboola.wr-db-snowflake, keboola.wr-db-pgsql
- **Version:** 1.0.1
- **Folder Location:** `keboola-git-github`

### Template: Asana Project Management
- **Description:** Aggregate all your Asana data to dramatically improve team collaboration and work management.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-asana-v2, keboola.wr-google-bigquery-v2, keboola.wr-google-sheets, <keboola.wr-snowflake>, keboola.wr-db-pgsql
- **Version:** 1.0.1
- **Folder Location:** `keboola-mgmt-asana`

### Template: Typeform
- **Description:** Aggregate Typeform data to build more meaningful customer relationships.
- **Backend Support:** snowflake, bigquery
- **Included Components:** fisa.ex-typeform, keboola.wr-google-bigquery-v2, keboola.wr-google-sheets, keboola.wr-db-snowflake, keboola.wr-db-pgsql
- **Version:** 1.0.1
- **Folder Location:** `keboola-typeform`

### Template: Google Analytics 4
- **Description:** Transform GA4 data into powerful insights for smarter marketing strategies.
- **Backend Support:** snowflake
- **Included Components:** keboola.ex-google-analytics-v4, kds-team.ex-google-search-console, keboola.wr-db-pgsql, keboola.wr-google-bigquery-v2, keboola.wr-google-sheets, <keboola.wr-snowflake>
- **Version:** 1.0.0
- **Folder Location:** `keboola-analytics-googleanalytics4`

### Template: Advertising Platforms
- **Description:** Optimize the monetization of your advertising data across multiple platforms.
- **Backend Support:** snowflake, bigquery
- **Included Components:** kds-team.ex-bing-ads, leochan.ex-linkedin, keboola.ex-facebook-ads, keboola.ex-google-ads, keboola.wr-google-sheets, keboola.wr-google-bigquery-v2, keboola.wr-db-snowflake, keboola.wr-db-pgsql, keboola.data-apps
- **Version:** 3.0.0
- **Folder Location:** `adsplatforms`

### Template: Emailing Mailchimp
- **Description:** Create a BDM from Mailchimp data and load it into Google Sheets, BigQuery, Snowflake or Postgres.
- **Backend Support:** snowflake, bigquery
- **Included Components:** keboola.ex-mailchimp, keboola.wr-google-sheets, keboola.wr-google-bigquery-v2, <keboola.wr-snowflake>, keboola.wr-db-pgsql
- **Version:** 1.0.0
- **Folder Location:** `mailchimp`

### Template: Shopify RFM Analysis with Streamlit
- **Description:** Perform RFM Analysis on Shopify demo data and visualize results in an interactive Data App.
- **Backend Support:** snowflake
- **Included Components:** keboola.data-apps, kds-team.ex-shopify, keboola.snowflake-transformation, <keboola.wr-snowflake>
- **Version:** 1.0.0
- **Folder Location:** `snowpark-streamlit`

### Template: GenAI Messaging Campaign
- **Description:** Elevate marketing with AI using Shopify data for personalized SMS campaigns via Twilio.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-shopify, kds-team.app-generative-ai, keboola.snowflake-transformation, kds-team.wr-twilio, keboola.data-apps
- **Version:** 1.0.0
- **Folder Location:** `ai-campaign-executer`

### Template: E-commerce EasyCompass
- **Description:** Deliver real-time KPI insights, alerts, and actions for data-driven decisions.
- **Backend Support:** snowflake
- **Included Components:** kds-team.ex-shopify, keboola.snowflake-transformation, keboola.data-apps, kds-team.wr-generic
- **Version:** 1.0.0
- **Folder Location:** `interactive-kpi-report`

### Template: UA and GA4 Comparison
- **Description:** Integrate and compare data from Universal Analytics and GA4 via BigQuery.
- **Backend Support:** snowflake
- **Included Components:** keboola.data-apps, keboola.ex-google-analytics-v4, keboola.ex-google-analytics-v4, keboola.ex-google-bigquery-v2, keboola.snowflake-transformation
- **Version:** 1.0.0
- **Folder Location:** `ua-and-ga4-comparison`

### Template: Kai SQL bot
- **Description:** Query your Snowflake database using an AI-driven SQL bot.
- **Backend Support:** snowflake
- **Included Components:** keboola.data-apps
- **Version:** 1.0.0
- **Folder Location:** `kai-sql-bot`

### Template: E-commerce Insights
- **Description:** Aggregate Shopify, WooCommerce, or BigCommerce data to uncover insights on inventory, customer behavior, and sales performance.
- **Backend Support:** snowflake
- **Included Components:** keboola.wr-db-pgsql, keboola.wr-google-bigquery-v2, keboola.wr-google-sheets, <keboola.wr-snowflake>, kds-team.ex-bigcommerce, kds-team.ex-shopify, kds-team.ex-woocommerce
- **Version:** 1.0.0
- **Folder Location:** `keboola-ecommerce`

### Template: CSAS - Template Merge
- **Description:** CSAS Merge example demonstrating a Snowflake transformation.
- **Backend Support:** snowflake
- **Included Components:** keboola.snowflake-transformation
- **Version:** 0.0.1
- **Folder Location:** `csas-template-merge`

### Template: CSAS - Template SCD
- **Description:** CSAS SCD example showcasing a Snowflake transformation.
- **Backend Support:** snowflake
- **Included Components:** keboola.snowflake-transformation
- **Version:** 0.0.1
- **Folder Location:** `csas-template-scd`

### Template: Keboola Data Editor
- **Description:** Simplify your data editing and management with this demo Data App integrated with Keboola Storage.
- **Backend Support:** snowflake
- **Included Components:** keboola.data-apps
- **Version:** 1.0.0
- **Folder Location:** `keboola-data-editor`

### Template: Hello World
- **Description:** Experience a Streamlit web app with interactive widgets and caching for fast data loading.
- **Backend Support:** snowflake
- **Included Components:** keboola.data-apps
- **Version:** 0.0.1
- **Folder Location:** `hello-world`

### Template: Snowflake Security Checkup
- **Description:** Detect anomalies and suspicious activities in query and login logs to enhance security.
- **Backend Support:** snowflake
- **Included Components:** keboola.ex-db-snowflake
- **Version:** 0.0.1
- **Folder Location:** `snowflake-security-checkup`

### Template: Review App Template
- **Description:** Generate review responses for various platforms.
- **Backend Support:** Not specified
- **Included Components:** keboola.data-apps, apify.apify
- **Version:** 1.0.0
- **Folder Location:** `review-app-template`

### Template: Newsletters Data App Template
- **Description:** Personalize HTML newsletters for different customer segments.
- **Backend Support:** Not specified
- **Included Components:** keboola.data-apps
- **Version:** 1.0.0
- **Folder Location:** `newsletters-data-app`

### Template: Resume Analyzer Template
- **Description:** Identify the most suitable candidates for the job.
- **Backend Support:** Not specified
- **Included Components:** keboola.data-apps, kds-team.ex-lever
- **Version:** 1.0.0
- **Folder Location:** `resume-analyzer`

### Template: RLHF Knowledge Base Data App
- **Description:** Upload PDF files, extract text, and query the extracted information using a Streamlit app.
- **Backend Support:** Not specified
- **Included Components:** keboola.data-apps
- **Version:** 1.0.0
- **Folder Location:** `rlhf-data-app`

## License

MIT licensed, see [LICENSE](./LICENSE) file.
