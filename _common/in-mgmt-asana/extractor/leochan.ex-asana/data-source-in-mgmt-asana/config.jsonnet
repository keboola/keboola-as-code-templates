{
  parameters: {
    api: {
      baseUrl: "https://app.asana.com/api/1.0/",
      pagination: {
        method: "response.url",
        urlKey: "next_page.uri",
      },
      http: {
        headers: {
          authorization: {
            "function": "concat",
            args: [
              "Bearer ",
              {
                attr: "#api_key",
              },
            ],
          },
          "Content-Type": "application/json",
        },
      },
    },
    config: {
      "#api_key": Input("ex-asana-config-api-key"),
      incrementalOutput: false,
      pageSize: 5,
      debug: false,
      jobs: [
        {
          endpoint: "workspaces",
          dataType: "workspaces",
          dataField: "data",
          params: {
            limit: {
              attr: "pageSize",
            },
          },
          children: [
            {
              endpoint: "workspaces/{1:workspaces_id}/users",
              placeholders: {
                "1:workspaces_id": "gid",
              },
              dataType: "users",
              dataField: "data",
              params: {
                limit: {
                  attr: "pageSize",
                },
              },
              children: [
                {
                  endpoint: "users/{1:users_id}",
                  placeholders: {
                    "1:users_id": "gid",
                  },
                  dataType: "users_details",
                  dataField: "data",
                },
              ],
            },
            {
              endpoint: "workspaces/{1:workspaces_id}/projects",
              placeholders: {
                "1:workspaces_id": "gid",
              },
              dataType: "projects",
              dataField: "data",
              params: {
                limit: {
                  attr: "pageSize",
                },
              },
              children: [
                {
                  endpoint: "projects/{1:projects_id}",
                  placeholders: {
                    "1:projects_id": "gid",
                  },
                  dataType: "projects_details",
                  dataField: "data",
                },
                {
                  endpoint: "projects/{1:project_id}/sections",
                  placeholders: {
                    "1:project_id": "gid",
                  },
                  dataType: "sections",
                  dataField: "data",
                  params: {
                    limit: {
                      attr: "pageSize",
                    },
                  },
                },
                {
                  endpoint: "projects/{1:project_id}/tasks",
                  placeholders: {
                    "1:project_id": "gid",
                  },
                  dataType: "tasks",
                  dataField: "data",
                  params: {
                    limit: {
                      attr: "pageSize",
                    },
                  },
                  children: [
                    {
                      endpoint: "tasks/{1:task_id}",
                      placeholders: {
                        "1:task_id": "gid",
                      },
                      dataType: "task_details",
                      dataField: "data",
                    },
                    {
                      endpoint: "tasks/{1:task_id}/subtasks",
                      placeholders: {
                        "1:task_id": "gid",
                      },
                      dataType: "task_subtasks",
                      dataField: "data",
                      params: {
                        limit: {
                          attr: "pageSize",
                        },
                      },
                    },
                    {
                      endpoint: "tasks/{1:task_id}/stories",
                      placeholders: {
                        "1:task_id": "gid",
                      },
                      dataType: "task_stories",
                      dataField: "data",
                      params: {
                        limit: {
                          attr: "pageSize",
                        },
                      },
                    },
                  ],
                },
              ],
            },
          ],
        },
      ],
      mappings: {
        projects: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          resource_type: {
            type: "column",
            mapping: {
              destination: "resource_type",
            },
          },
          parent_gid: {
            type: "user",
            mapping: {
              destination: "parent_id",
            },
          },
        },
        projects_details: {
          notes: {
            type: "column",
            mapping: {
              destination: "notes",
            },
          },
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          archived: {
            type: "column",
            mapping: {
              destination: "archived",
            },
          },
          color: {
            type: "column",
            mapping: {
              destination: "color",
            },
          },
          "current_status.text": {
            type: "column",
            mapping: {
              destination: "current_status_text",
            },
          },
          "workspace.name": {
            type: "column",
            mapping: {
              destination: "workspace_name",
            },
          },
          "owner.name": {
            type: "column",
            mapping: {
              destination: "owner_name",
            },
          },
          "owner.gid": {
            type: "column",
            mapping: {
              destination: "owner_id",
            },
          },
          modified_at: {
            type: "column",
            mapping: {
              destination: "modified_at",
            },
          },
          public: {
            type: "column",
            mapping: {
              destination: "public",
            },
          },
          "workspace.gid": {
            type: "column",
            mapping: {
              destination: "workspace_id",
            },
          },
          created_at: {
            type: "column",
            mapping: {
              destination: "created_at",
            },
          },
          layout: {
            type: "column",
            mapping: {
              destination: "layout",
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          "current_status.color": {
            type: "column",
            mapping: {
              destination: "current_status_color",
            },
          },
          "current_status.modified_at": {
            type: "column",
            mapping: {
              destination: "current_status_modified_at",
            },
          },
          followers: {
            type: "table",
            destination: "projects-followers",
            tableMapping: {
              gid: {
                type: "column",
                mapping: {
                  destination: "id",
                },
              },
              name: {
                type: "column",
                mapping: {
                  destination: "name",
                },
              },
            },
          },
          "current_status.author.gid": {
            type: "column",
            mapping: {
              destination: "current_status_author_id",
            },
          },
          custom_field_settings: {
            type: "table",
            destination: "projects-custom_field_settings",
            tableMapping: {
              gid: {
                type: "column",
                mapping: {
                  destination: "id",
                },
              },
              "custom_field.gid": {
                type: "column",
                mapping: {
                  destination: "custom_field_id",
                },
              },
              "custom_field.name": {
                type: "column",
                mapping: {
                  destination: "custom_field_name",
                },
              },
              "custom_field.type": {
                type: "column",
                mapping: {
                  destination: "custom_field_type",
                },
              },
              is_important: {
                type: "column",
                mapping: {
                  destination: "is_important",
                },
              },
              "project.gid": {
                type: "column",
                mapping: {
                  destination: "project_id",
                },
              },
              "project.name": {
                type: "column",
                mapping: {
                  destination: "project_name",
                },
              },
              "custom_field.enum_options": {
                type: "table",
                destination: "projects-custom_field_settings-enum_options",
                tableMapping: {
                  gid: {
                    type: "column",
                    mapping: {
                      destination: "id",
                    },
                  },
                  name: {
                    type: "column",
                    mapping: {
                      destination: "name",
                    },
                  },
                  color: {
                    type: "column",
                    mapping: {
                      destination: "color",
                    },
                  },
                  enabled: {
                    type: "column",
                    mapping: {
                      destination: "enabled",
                    },
                  },
                },
              },
            },
          },
          "current_status.author.name": {
            type: "column",
            mapping: {
              destination: "current_status_author_name",
            },
          },
          members: {
            type: "table",
            destination: "projects-members",
            tableMapping: {
              gid: {
                type: "column",
                mapping: {
                  destination: "id",
                },
              },
              name: {
                type: "column",
                mapping: {
                  destination: "name",
                },
              },
            },
          },
          due_date: {
            type: "column",
            mapping: {
              destination: "due_date",
            },
          },
        },
        sections: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          parent_gid: {
            type: "user",
            mapping: {
              destination: "project_id",
            },
          },
        },
        tasks: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          parent_gid: {
            type: "user",
            mapping: {
              destination: "project_id",
            },
          },
        },
        task_details: {
          notes: {
            type: "column",
            mapping: {
              destination: "notes",
            },
          },
          assignee_status: {
            type: "column",
            mapping: {
              destination: "assignee_status",
            },
          },
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          "assignee.gid": {
            type: "column",
            mapping: {
              destination: "assignee_id",
            },
          },
          completed_at: {
            type: "column",
            mapping: {
              destination: "completed_at",
            },
          },
          custom_fields: {
            type: "table",
            destination: "task_details-custom_fields",
            tableMapping: {
              enum_options: {
                type: "table",
                destination: "task_details-custom_field-enum_options",
                tableMapping: {
                  gid: {
                    type: "column",
                    mapping: {
                      destination: "id",
                    },
                  },
                  name: {
                    type: "column",
                    mapping: {
                      destination: "name",
                    },
                  },
                  color: {
                    type: "column",
                    mapping: {
                      destination: "color",
                    },
                  },
                  enabled: {
                    type: "column",
                    mapping: {
                      destination: "enabled",
                    },
                  },
                },
              },
              enabled: {
                type: "column",
                mapping: {
                  destination: "enabled",
                },
              },
              gid: {
                type: "column",
                mapping: {
                  destination: "id",
                },
              },
              "enum_value.enabled": {
                type: "column",
                mapping: {
                  destination: "enum_value_enabled",
                },
              },
              "enum_value.name": {
                type: "column",
                mapping: {
                  destination: "enum_value_name",
                },
              },
              "enum_value.gid": {
                type: "column",
                mapping: {
                  destination: "enum_value_id",
                },
              },
              "enum_value.color": {
                type: "column",
                mapping: {
                  destination: "enum_value_color",
                },
              },
              name: {
                type: "column",
                mapping: {
                  destination: "name",
                },
              },
              type: {
                type: "column",
                mapping: {
                  destination: "type",
                },
              },
              number_value: {
                type: "column",
                mapping: {
                  destination: "number_value",
                },
              },
              precision: {
                type: "column",
                mapping: {
                  destination: "precision",
                },
              },
            },
          },
          modified_at: {
            type: "column",
            mapping: {
              destination: "modified_at",
            },
          },
          due_on: {
            type: "column",
            mapping: {
              destination: "due_on",
            },
          },
          created_at: {
            type: "column",
            mapping: {
              destination: "created_at",
            },
          },
          "assignee.name": {
            type: "column",
            mapping: {
              destination: "assignee_name",
            },
          },
          completed: {
            type: "column",
            mapping: {
              destination: "completed",
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          "parent.name": {
            type: "column",
            mapping: {
              destination: "parent_name",
            },
          },
          followers: {
            type: "table",
            destination: "task_details-followers",
            tableMapping: {
              gid: {
                type: "column",
                mapping: {
                  destination: "id",
                },
              },
              name: {
                type: "column",
                mapping: {
                  destination: "name",
                },
              },
            },
          },
          tags: {
            type: "table",
            destination: "task_details-tags",
            tableMapping: {
              gid: {
                type: "column",
                mapping: {
                  destination: "id",
                },
              },
              name: {
                type: "column",
                mapping: {
                  destination: "name",
                },
              },
            },
          },
          memberships: {
            type: "table",
            destination: "task_details-memberships",
            tableMapping: {
              "project.gid": {
                type: "column",
                mapping: {
                  destination: "project_id",
                },
              },
              "project.name": {
                type: "column",
                mapping: {
                  destination: "project_name",
                },
              },
              "section.gid": {
                type: "column",
                mapping: {
                  destination: "section_id",
                },
              },
              "section.name": {
                type: "column",
                mapping: {
                  destination: "section_name",
                },
              },
            },
          },
          "parent.gid": {
            type: "column",
            mapping: {
              destination: "parent_id",
            },
          },
          due_at: {
            type: "column",
            mapping: {
              destination: "due_at",
            },
          },
        },
        task_subtasks: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          parent_id: {
            type: "user",
            mapping: {
              destination: "task_id",
            },
          },
        },
        task_stories: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          parent_gid: {
            type: "user",
            mapping: {
              destination: "task_id",
            },
          },
          "created_by.gid": {
            type: "column",
            mapping: {
              destination: "created_by_id",
            },
          },
          "created_by.name": {
            type: "column",
            mapping: {
              destination: "created_by_name",
            },
          },
          created_at: {
            type: "column",
            mapping: {
              destination: "created_at",
            },
          },
          text: {
            type: "column",
            mapping: {
              destination: "text",
            },
          },
          type: {
            type: "column",
            mapping: {
              destination: "type",
            },
          },
          resource_type: {
            type: "column",
            mapping: {
              destination: "resource_type",
            },
          },
          resource_subtype: {
            type: "column",
            mapping: {
              destination: "resource_subtype",
            },
          },
        },
        users: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          resource_type: {
            type: "column",
            mapping: {
              destination: "resource_type",
            },
          },
        },
        users_details: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          email: {
            type: "column",
            mapping: {
              destination: "email",
            },
          },
          resource_type: {
            type: "column",
            mapping: {
              destination: "resource_type",
            },
          },
        },
        workspaces: {
          gid: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          name: {
            type: "column",
            mapping: {
              destination: "name",
            },
          },
          resource_type: {
            type: "column",
            mapping: {
              destination: "resource_type",
            },
          },
        },
      },
    },
  },
}
