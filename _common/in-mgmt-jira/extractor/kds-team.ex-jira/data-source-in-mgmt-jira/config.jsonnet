{
  parameters: {
    since: Input("ex-jira-since"),
    "#token": Input("ex-jira-token"),
    datasets: [
      "issues",
      "issues_changelogs",
      "worklogs",
      "boards_n_sprints",
    ],
    username: Input("ex-jira-username"),
    custom_jql: [],
    incremental: 1,
    organization_id: Input("ex-jira-organization-id"),
    organization_url: Input("ex-jira-organization-url"),
  },
}
