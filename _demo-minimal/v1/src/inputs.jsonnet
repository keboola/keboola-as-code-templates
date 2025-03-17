{
  stepsGroups: [
    {
      description: "Choose one of the eshop platforms.",
      required: "atLeastOne",
      steps: [
        {
          icon: "common:download",
          name: "Generic Extractor",
          description: "A generic extractor configuration.",
          dialogName: "Generic Extractor Dialog",
          dialogDescription: "Please configure Generic Extractor.",
          inputs: [
            {
              Id:          "debug",
              Name:        "Debug Mode",
              Description: "In debug mode, the extractor displays all API requests.",
              Type:        "bool",
              Kind:        "confirm",
              Default:     true,
            }
          ],
        },
      ],
    },
  ],
}
