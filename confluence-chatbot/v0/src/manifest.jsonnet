{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("custom-confluence-chatbot"),
  },
  configurations: [
    {
      componentId: "keboola.data-apps",
      id: ConfigId("my-data-app"),
      path: "app/keboola.data-apps/my-data-app",
      rows: [],
    },
    {
      componentId: "kds-team.ex-confluence",
      id: ConfigId("my-confluence-data-source"),
      path: "extractor/kds-team.ex-confluence/my-confluence-data-source",
      rows: [],
    },
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("custom-confluence-chatbot"),
      path: "other/keboola.orchestrator/custom-confluence-chatbot",
      rows: [],
    },
    {
      componentId: "keboola.python-transformation-v2",
      id: ConfigId("knowledge-curation"),
      path: "transformation/keboola.python-transformation-v2/knowledge-curation",
      rows: [],
    },
    {
      componentId: "kds-team.wr-pinecone",
      id: ConfigId("my-pinecone-data-destination"),
      path: "writer/kds-team.wr-pinecone/my-pinecone-data-destination",
      rows: [],
    },
  ],
}
