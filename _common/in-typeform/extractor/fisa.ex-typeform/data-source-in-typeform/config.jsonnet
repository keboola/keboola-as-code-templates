{
  parameters: {
    api: {
      baseUrl: "https://api.typeform.com/",
      http: {
        headers: {
          "Content-Type": "application/json",
          Accept: "application/json",
          Authorization: {
            "function": "concat",
            args: [
              "Bearer ",
              {
                attr: "#token",
              },
            ],
          },
        },
      },
      pagination: {
        method: "multiple",
        scrollers: {
          pagenum: {
            method: "pagenum",
          },
        },
      },
    },
    config: {
      "#token": Input("ex-typeform-config-token"),
      jobs: [
        {
          endpoint: "forms",
          scroller: "pagenum",
          dataType: "forms",
          dataField: "items",
          children: [
            {
              endpoint: "forms/{id}",
              placeholders: {
                id: "id",
              },
              dataType: "form",
              dataField: ".",
            },
            {
              endpoint: "forms/{id}/responses",
              scroller: "pagenum",
              placeholders: {
                id: "id",
              },
              dataType: "responses",
              dataField: "items",
            },
          ],
        },
      ],
      mappings: {
        forms: {
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          title: {
            mapping: {
              destination: "title",
            },
          },
          last_updated_at: {
            mapping: {
              destination: "last_updated_at",
            },
          },
          settings_is_public: {
            mapping: {
              destination: "settings_is_public",
            },
          },
          settings_is_trial: {
            mapping: {
              destination: "settings_is_trial",
            },
          },
          self_href: {
            mapping: {
              destination: "self_href",
            },
          },
          theme_href: {
            mapping: {
              destination: "theme_href",
            },
          },
          links_display: {
            mapping: {
              destination: "links_display",
            },
          },
        },
        form: {
          "settings.meta.google_tag_manager": {
            mapping: {
              destination: "settings_meta_google_tag_manager",
            },
          },
          "settings.language": {
            mapping: {
              destination: "settings_language",
            },
          },
          "workspace.href": {
            mapping: {
              destination: "workspace_href",
            },
          },
          "settings.show_typeform_branding": {
            mapping: {
              destination: "settings_show_typeform_branding",
            },
          },
          "settings.meta.facebook_pixel": {
            mapping: {
              destination: "settings_meta_facebook_pixel",
            },
          },
          "settings.is_trial": {
            mapping: {
              destination: "settings_is_trial",
            },
          },
          "settings.progress_bar": {
            mapping: {
              destination: "settings_progress_bar",
            },
          },
          "theme.href": {
            mapping: {
              destination: "theme_href",
            },
          },
          "settings.is_public": {
            mapping: {
              destination: "settings_is_public",
            },
          },
          title: {
            mapping: {
              destination: "title",
            },
          },
          "settings.show_progress_bar": {
            mapping: {
              destination: "settings_show_progress_bar",
            },
          },
          fields: {
            type: "table",
            destination: "form_fields",
            tableMapping: {
              id: {
                mapping: {
                  destination: "fields_id",
                },
              },
              title: {
                mapping: {
                  destination: "fields_title",
                },
              },
              ref: {
                mapping: {
                  destination: "fields_ref",
                },
              },
              "validations.required": {
                mapping: {
                  destination: "fields_validations_required",
                },
              },
              type: {
                mapping: {
                  destination: "fields_type",
                },
              },
              properties: {
                type: "table",
                destination: "form_fields_properties",
                tableMapping: {
                  show_labels: {
                    mapping: {
                      destination: "show_labels",
                    },
                  },
                  shape: {
                    mapping: {
                      destination: "shape",
                    },
                  },
                  "fields.properties.labels": {
                    type: "table",
                    destination: "form_fields_properties_labels",
                    tableMapping: {
                      id: {
                        mapping: {
                          destination: "id",
                        },
                      },
                      left: {
                        mapping: {
                          destination: "left",
                        },
                      },
                      right: {
                        mapping: {
                          destination: "right",
                        },
                      },
                      center: {
                        mapping: {
                          destination: "center",
                        },
                      },
                    },
                  },
                  separator: {
                    mapping: {
                      destination: "separator",
                    },
                  },
                  allow_other_choice: {
                    mapping: {
                      destination: "allow_other_choice",
                    },
                  },
                  alphabetical_order: {
                    mapping: {
                      destination: "alphabetical_order",
                    },
                  },
                  steps: {
                    mapping: {
                      destination: "steps",
                    },
                  },
                  supersized: {
                    mapping: {
                      destination: "supersized",
                    },
                  },
                  hide_marks: {
                    mapping: {
                      destination: "hide_marks",
                    },
                  },
                  randomize: {
                    mapping: {
                      destination: "randomize",
                    },
                  },
                  choices: {
                    type: "table",
                    destination: "form_fields_properties_choices",
                    tableMapping: {
                      id: {
                        mapping: {
                          destination: "id",
                        },
                      },
                      ref: {
                        mapping: {
                          destination: "ref",
                        },
                      },
                      label: {
                        mapping: {
                          destination: "label",
                        },
                      },
                    },
                  },
                  structure: {
                    mapping: {
                      destination: "structure",
                    },
                  },
                  allow_multiple_selection: {
                    mapping: {
                      destination: "allow_multiple_selection",
                    },
                  },
                  vertical_alignment: {
                    mapping: {
                      destination: "vertical_alignment",
                    },
                  },
                  button_text: {
                    mapping: {
                      destination: "button_text",
                    },
                  },
                  description: {
                    mapping: {
                      destination: "description",
                    },
                  },
                },
                "fields.properties.currency": {
                  type: "table",
                  destination: "form_fields_properties_currency",
                  tableMapping: {
                    id: {
                      mapping: {
                        destination: "id",
                      },
                    },
                    type: {
                      mapping: {
                        destination: "type",
                      },
                    },
                    value: {
                      mapping: {
                        destination: "value",
                      },
                    },
                  },
                },
                show_button: {
                  mapping: {
                    destination: "show_button",
                  },
                },
              },
              "fields.validations": {
                type: "table",
                destination: "form_fields_validations",
                tableMapping: {
                  id: {
                    mapping: {
                      destination: "id",
                    },
                  },
                  max_length: {
                    mapping: {
                      destination: "required",
                    },
                  },
                  min_value: {
                    mapping: {
                      destination: "right",
                    },
                  },
                  max_value: {
                    mapping: {
                      destination: "center",
                    },
                  },
                },
              },
              "fields.attachment": {
                type: "table",
                destination: "form_fields_attachment",
                tableMapping: {
                  id: {
                    mapping: {
                      destination: "id",
                    },
                  },
                  type: {
                    mapping: {
                      destination: "type",
                    },
                  },
                  href: {
                    mapping: {
                      destination: "href",
                    },
                  },
                  scale: {
                    mapping: {
                      destination: "scale",
                    },
                  },
                },
              },
            },
            hidden: {
              mapping: {
                destination: "hidden",
              },
            },
          },
          id: {
            mapping: {
              destination: "id",
              primaryKey: true,
            },
          },
          "settings.meta.google_analytics": {
            mapping: {
              destination: "settings_meta_google_analytics",
            },
          },
        },
        responses: {
          "calculated.score": {
            mapping: {
              destination: "score",
            },
          },
          landed_at: {
            mapping: {
              destination: "landed_at",
            },
          },
          "metadata.network_id": {
            mapping: {
              destination: "network_id",
            },
          },
          "metadata.referer": {
            mapping: {
              destination: "referer",
            },
          },
          parent_id: {
            mapping: {
              destination: "parent_id",
              primaryKey: true,
            },
          },
          "metadata.user_agent": {
            mapping: {
              destination: "user_agent",
            },
          },
          "metadata.platform": {
            mapping: {
              destination: "platform",
            },
          },
          answers: {
            type: "table",
            destination: "responses_answers",
            tableMapping: {
              "payment.amount": {
                mapping: {
                  destination: "payment_amount",
                },
              },
              "choice.other": {
                mapping: {
                  destination: "choice_other",
                },
              },
              "field.title": {
                mapping: {
                  destination: "field_title",
                },
              },
              "choice.label": {
                mapping: {
                  destination: "choice_label",
                },
              },
              boolean: {
                mapping: {
                  destination: "boolean",
                },
              },
              number: {
                mapping: {
                  destination: "number",
                },
              },
              file_url: {
                mapping: {
                  destination: "file_url",
                },
              },
              text: {
                mapping: {
                  destination: "text",
                },
              },
              "field.type": {
                mapping: {
                  destination: "field_type",
                },
              },
              date: {
                mapping: {
                  destination: "date",
                },
              },
              url: {
                mapping: {
                  destination: "url",
                },
              },
              "field.id": {
                mapping: {
                  destination: "field_id",
                },
              },
              "payment.name": {
                mapping: {
                  destination: "payment_name",
                },
              },
              "choices.other": {
                mapping: {
                  destination: "choices_other",
                },
              },
              "payment.last4": {
                mapping: {
                  destination: "payment_last4",
                },
              },
              "choices.label": {
                mapping: {
                  destination: "choices_label",
                },
              },
              type: {
                mapping: {
                  destination: "type",
                },
              },
              email: {
                mapping: {
                  destination: "email",
                },
              },
              "field.ref": {
                mapping: {
                  destination: "field_ref",
                },
              },
            },
          },
          submitted_at: {
            mapping: {
              destination: "submitted_at",
            },
          },
          response_id: {
            mapping: {
              destination: "response_id",
              primaryKey: true,
            },
          },
          "hidden.id": {
            mapping: {
              destination: "hidden_id",
            },
          },
        },
      },
    },
  },
}
