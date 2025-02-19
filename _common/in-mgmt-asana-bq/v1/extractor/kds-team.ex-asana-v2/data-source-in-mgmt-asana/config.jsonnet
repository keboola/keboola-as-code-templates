{
  parameters: {
    "#token": Input("ex-asana-config-api-key"),
    endpoints: {
      projects_sections_tasks: true,
      projects_tasks_subtasks: true,
      user_defined_projects: true,
      users: true,
      projects_tasks: true,
      users_details: true,
      projects_tasks_details: true,
      projects_sections: true,
      archived_projects: true,
      projects: true,
      projects_tasks_stories: true,
    },
    project_id: Input("ex-asana-project_id"),
    incremental_load: false,
    skip_unauthorized: false,
  },
}
