{
  name: "kds-team.wr-pinecone-" + ConfigId("my-pinecone-data-destination"),
  enabled: true,
  task: {
    mode: "run",
    configPath: "writer/kds-team.wr-pinecone/my-pinecone-data-destination",
  },
  continueOnFailure: false,
}
