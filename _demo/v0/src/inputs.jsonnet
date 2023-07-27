{
  stepsGroups: [
    {
      description: "Choose one of the eshop platforms.",
      required: "atLeastOne",
      steps: [
        {
          icon: "common:download",
          name: "Super Ecommerce",
          description: "Sell online with the Super E-commerce website.",
          dialogName: "Other Ecommerce",
          dialogDescription: "Please configure credentials to your Super Ecommerce account.",
          inputs: [
            {
              Id:          "user",
              Name:        "User Name",
              Description: "",
              Type:        "string",
              Kind:        "input",
              Default:     "john",
              Rules:       "required",
            },
            {
              Id:          "api-token",
              Name:        "API Token",
              Description: "Insert Service API Token.",
              Type:        "string",
              Kind:        "hidden",
              Default:     "",
              Rules:       "required,min=10",
            },
            {
              Id:          "export-description",
              Name:        "Description",
              Description: "Please enter a short description of what this export is for.",
              Type:        "string",
              Kind:        "textarea",
              Default:     "This export exports data to ...",
            },
            {
              Id:          "country",
              Name:        "Country",
              Description: "Please select one country.",
              Type:        "string",
              Kind:        "select",
              Default:     "value1",
              Options:     [
                {
                  Label: "Country 1",
                  Value: "value1",
                },
                {
                  Label: "Country 2",
                  Value: "value2",
                },
                {
                  Label: "Country 3",
                  Value: "value3",
                },
              ],
            },
            {
              Id:          "limit",
              Name:        "Limit",
              Description: "Enter the maximum number of records.",
              Type:        "int",
              Kind:        "input",
              Default:     1000,
            },
            {
              Id:          "person-height",
              Name:        "Person Height",
              Description: "",
              Type:        "double",
              Kind:        "input",
              Default:     178.5,
            },
            {
              Id:          "dummy-data",
              Name:        "Generate dummy data",
              Description: "Do you want to generate dummy data?",
              Type:        "bool",
              Kind:        "confirm",
              Default:     true,
            },
            {
              Id:          "countries",
              Name:        "Countries",
              Description: "Please select at least one country.",
              Type:        "string[]",
              Kind:        "multiselect",
              Default:     ["value1", "value3"],
              Options:     [
                {
                  Label: "Country 1",
                  Value: "value1",
                },
                {
                  Label: "Country 2",
                  Value: "value2",
                },
                {
                  Label: "Country 3",
                  Value: "value3",
                },
              ],
            },
          ],
        },
        {
          icon: "common:download",
          name: "Other Ecommerce",
          description: "Alternative ecommerce solution.",
          dialogName: "Other Ecommerce",
          dialogDescription: "Alternative ecommerce solution.",
          inputs: [
            {
              Id:          "host",
              Name:        "Service Host",
              Description: "Base path of the Service API.",
              Type:        "string",
              Kind:        "input",
              Default:     "example.com",
            },
            {
              Id:          "token",
              Name:        "Service Token",
              Description: "Service API token.",
              Type:        "string",
              Kind:        "hidden",
              Default:     "",
            },
          ],
        },
      ],
    },
    {
      description: "Just an informing group without inputs",
      required: "all",
      steps: [
        {
          icon: "common:download",
          name: "Snowflake",
          description: "Transformation",
          dialogName: "Snowflake",
          dialogDescription: "Step without inputs, locked, for illustration only.",
          inputs: [],
        },
      ],
    },
    {
      description: "Select some destinations if you want.",
      required: "optional",
      steps: [
        {
          icon: "common:upload",
          name: "Service 1",
          description: "Some external service.",
          dialogName: "Snowflake",
          dialogDescription: "Some external service.",
          inputs: [
            {
              Id:          "g3s1-host",
              Name:        "Service Host",
              Description: "Base path of the Service API.",
              Type:        "string",
              Kind:        "input",
              Default:     "example.com",
            },
          ],
        },
        {
          icon: "component:keboola.wr-google-drive",
          name: "Maximum length step name",
          description: "Maximum length desc lorem ipsum dolor sit amet consectetur.",
          dialogName: "Maximum dialog step name",
          dialogDescription: "Maximum dialog description lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nas.",
          inputs: [
            {
              Id:          "g3s2-host",
              Name:        "Input With Max Length Xy",
              Description: "Far far away, behind the word mountains, far from the countr",
              Type:        "string",
              Kind:        "input",
              Default:     "A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring white...",
            },
          ],
        },
        {
          icon: "component:keboola.wr-google-sheets",
          name: "Service 3",
          description: "Some external service.",
          dialogName: "Service 3",
          dialogDescription: "Some external service.",
          inputs: [],
        },
        {
          icon: "component:keboola.wr-snowflake-blob-storage",
          name: "Service 4",
          description: "Some external service.",
          dialogName: "Service 4",
          dialogDescription: "Some external service.",
          inputs: [
            {
              Id:          "g3s4-host",
              Name:        "Service Host",
              Description: "Base path of the Service API.",
              Type:        "string",
              Kind:        "input",
              Default:     "example.com",
            },
          ],
        },
        {
          icon: "component:tde-exporter",
          name: "Service 5",
          description: "Some external service.",
          dialogName: "Service 5 Dialog Name",
          dialogDescription: "Some external service.",
          inputs: [
            {
              Id:          "g3s5-host",
              Name:        "Service Host",
              Description: "Base path of the Service API.",
              Type:        "string",
              Kind:        "input",
              Default:     "example.com",
            },
          ],
        },
      ],
    },
  ],
}
