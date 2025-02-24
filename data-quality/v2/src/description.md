### This Flow brings you set of Snowflake SQL procedures for data quality testing and monitoring.

After using this template navigate to Transformations.
- You’ll find newly added Shared Codes under ***Shared Codes*** tab. Key shared code is the `Data Quality Core`.
- You’ll find a new transformation `Data Quality Core - Full Example` which shows how the Shared Codes can be used. 
- You'll also find a Transformation named `Data Quality Core - ABORT/FAIL Example` which demonstrates how to use the FAIL level of tests to ABORT a transformation in case such test fails. It also uses the write_always parameter of output mapping in order to write the output even on Transformation error.

The transformation creates new table in your ***Storage*** named ``` DQ_RESULTS_LOG ```.