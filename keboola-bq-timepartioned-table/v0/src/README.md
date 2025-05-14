### keboola.bq-timepartioned-table

# BigQuery Time Partitioned Table Creator
To use the component, load the template and fill in the required details. This template will create a typed BigQuery table in storage, with two columns and 0 rows.
1. Primary Key column (can be any type, but must be a unique value). [Bigquery Data types](https://cloud.google.com/bigquery/docs/reference/standard-sql/data-types).
2. Partitioning column. As the table will be partitioned by time, this column must be a DATE or TIMESTAMP

Once you have created your table, you can then use a Keboola BigQuery SQL transformation to add additional columns and rows. 


