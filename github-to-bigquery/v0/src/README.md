The process is simple. We will guide you through it, and, when needed, ask you to provide your credentials, and authorize the source and destination components.

The flow, in a nutshell:

- First, the GitHub source component will collect data from your GitHub account (organizations, teams, members, repositories, commits, issues, and pull requests).

- We then prepare tables containing organizations and users, and use them to create the output tables. 

- The data is then written into a Google BigQuery database via the BigQuery destination component.

- Finally, you will schedule and run the entire flow (i.e., the sequence of all the prepared, above mentioned steps, in the correct order). The GitHub source component, all data manipulations, and the BigQuery destination component, will be processed.

