{
  parameters: {
    api: {
      baseUrl: {
        "function": "concat",
        args: [
          "https://",
          {
            attr: Input("ex-pipedrive-api-base-url-args-1-attr"),
          },
          ".pipedrive.com/v1/",
        ],
      },
      authentication: {
        type: "url.query",
        query: {
          api_token: {
            attr: Input("ex-pipedrive-api-authentication-query-api-token-attr"),
          },
        },
      },
      pagination: {
        method: "offset",
        limit: 500,
        limitParam: "limit",
        offsetParam: "start",
      },
    },
    config: {
      "#apiToken": Input("ex-pipedrive-config-api-token"),
      companyDomain: "fcgvuzbihj",
      incrementalOutput: true,
      jobs: [
        {
          endpoint: "organizations",
          dataField: "data",
          dataType: "organizations",
        },
        {
          endpoint: "persons",
          dataField: "data",
          dataType: "persons",
        },
        {
          endpoint: "users",
          dataField: "data",
          dataType: "users",
        },
        {
          endpoint: "deals",
          dataField: "data",
          dataType: "deals",
        },
        {
          endpoint: "pipelines",
          dataField: "data",
          dataType: "pipelines",
        },
        {
          params: {
            user_id: "0",
          },
          endpoint: "activities",
          dataField: "data",
          dataType: "activities",
        },
        {
          endpoint: "stages",
          dataField: "data",
          dataType: "stages",
        },
      ],
      mappings: {
        organizations: {
          id: {
            mapping: {
              destination: "organization_id",
              primaryKey: true,
            },
          },
          name: "org_name",
          "owner_id.id": "owner_id",
          address: "org_address",
          category_id: "fk_category_id",
          address_country: "org_address_country",
          address_postal_code: "org_address_postal_code",
          add_date: "org_add_date",
        },
        persons: {
          id: {
            mapping: {
              destination: "contact_id",
              primaryKey: true,
            },
          },
          name: "contact_name",
          "org_id.value": "org_id",
          add_time: "add_time",
          email: {
            type: "table",
            destination: "person_emails",
            parentKey: {
              destination: "contact_id",
              primaryKey: true,
            },
            tableMapping: {
              label: {
                type: "column",
                mapping: {
                  destination: "label",
                  primaryKey: true,
                },
              },
              value: {
                type: "column",
                mapping: {
                  destination: "value",
                  primaryKey: true,
                },
              },
              primary: {
                type: "column",
                mapping: {
                  destination: "primary",
                },
              },
            },
          },
        },
        users: {
          id: {
            mapping: {
              destination: "owner_id",
              primaryKey: true,
            },
          },
          name: "owner_name",
          email: "owner_email",
        },
        deals: {
          active: "deal_active",
          "person_id.value": "person_id",
          lost_time: "lost_time",
          add_time: "add_time",
          currency: "deal_currency",
          value: "deal_value",
          "user_id.value": "owner_id",
          status: "deal_status",
          close_time: "close_time",
          products_count: "products_count",
          stage_order_nr: "stage_order_nr",
          won_time: "won_time",
          title: "deal_title",
          pipeline_id: "pipeline_id",
          deleted: "deal_deleted",
          "org_id.value": "org_id",
          id: {
            mapping: {
              destination: "deal_id",
              primaryKey: true,
            },
          },
          expected_close_date: "expected_close_date",
          stage_id: "stage_id",
          activities_count: "activities_count",
          email_messages_count: "email_messages_count",
          lost_reason: "lost_reason",
        },
        pipelines: {
          id: {
            mapping: {
              destination: "pipeline_id",
              primaryKey: true,
            },
          },
          name: "pipeline_name",
          url_title: "url_title",
          order_nr: "order_nr",
          active: "active",
        },
        activities: {
          done: "done",
          person_id: "person_id",
          add_time: "add_time",
          subject: "subject",
          deal_id: "deal_id",
          user_id: "user_id",
          due_date: "due_date",
          type: "type",
          id: {
            mapping: {
              destination: "activity_id",
              primaryKey: true,
            },
          },
          company_id: "company_id",
        },
        stages: {
          id: {
            mapping: {
              destination: "stage_id",
              primaryKey: true,
            },
          },
          order_nr: "order_nr",
          name: "stage_name",
          active_flag: "active_flag",
          pipeline_id: "pipeline_id",
          deal_probability: "deal_probability",
          add_time: "add_time",
        },
      },
    },
  },
}
