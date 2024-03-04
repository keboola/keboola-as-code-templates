local mailchimp = import "/<common>/in-mailchimp/inputs.jsonnet";
local hubspot = import "/<common>/in-crm-hubspot/v0/src/inputs.jsonnet";
{
  stepsGroups: [

    {
      description: "zero or one",
      required: "zeroOrOne",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Zero or one",
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
          description: "Zero or one",
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
      description: "exactly one",
      required: "exactlyOne",
      steps: [
        {
          icon: "component:keboola.ex-mailchimp",
          name: "Mailchimp",
          description: "Exactly one",
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
          description: "Exactly one",
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

