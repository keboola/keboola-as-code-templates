local mailchimp = import "/<common>/in-mailchimp/inputs.jsonnet";
local hubspot = import "/<common>/in-crm-hubspot/v0/src/inputs.jsonnet";
{
  stepsGroups: [
    {
      description: "Configure your credentials for Mailchimp data source.",
      required: "all",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Mailchimp - Data Source",
          dialogName: "Mailchimp Data Source", 
          dialogDescription: "Extractor collects data from Mailchimp about campaigns, lists and members.",
          inputs: mailchimp
        },
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "Description.",
          inputs: hubspot
        }
      ]
    },
    {
      description: "optional",
      required: "optional",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Mailchimp - Data Source",
          dialogName: "Mailchimp Data Source", 
          dialogDescription: "Extractor collects data from Mailchimp about campaigns, lists and members.",
          inputs: [{
            id: "id3",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        },
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "Description.",
          inputs: [{
            id: "id4",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        }
      ]
    },
    {
      description: "zero or one",
      required: "zeroOrOne",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Mailchimp - Data Source",
          dialogName: "Mailchimp Data Source", 
          dialogDescription: "Extractor collects data from Mailchimp about campaigns, lists and members.",
          inputs: [{
            id: "id5",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        },
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "Description.",
          inputs: [{
            id: "id6",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        }
      ]
    },
    {
      description: "at least one",
      required: "atLeastOne",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Mailchimp - Data Source",
          dialogName: "Mailchimp Data Source", 
          dialogDescription: "Extractor collects data from Mailchimp about campaigns, lists and members.",
          inputs: [{
            id: "id7",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        },
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "Description.",
          inputs: [{
            id: "id8",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        }
      ]
    },
    {
      description: "exactly one",
      required: "exactlyOne",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Mailchimp - Data Source",
          dialogName: "Mailchimp Data Source", 
          dialogDescription: "Extractor collects data from Mailchimp about campaigns, lists and members.",
          inputs: [{
            id: "id9",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        },
        {
          icon: "component:kds-team.ex-hubspot-crm",
          name: "Hubspot",
          description: "Hubspot - Data Source",
          dialogName: "Hubspot Data Source", 
          dialogDescription: "Description.",
          inputs: [{
            id: "id10",
            name: "Hostname",
            description: "Insert database hostname",
            type: "string",
            kind: "input",
          }]
        }
      ]
    },
  ],
}

