{
  parameters: {
    path: "seed_beers.csv",
  },
  processors: {
    after: [
      {
        definition: {
          component: "keboola.processor-move-files",
        },
        parameters: {
          direction: "tables",
          folder: "seed_beers",
        },
      },
      {
        definition: {
          component: "keboola.processor-create-manifest",
        },
        parameters: {
          delimiter: ",",
          enclosure: '"',
          incremental: false,
          primary_key: [
            "id",
          ],
          columns_from: "header",
        },
      },
      {
        definition: {
          component: "keboola.processor-skip-lines",
        },
        parameters: {
          lines: 1,
        },
      },
    ],
  },
}
