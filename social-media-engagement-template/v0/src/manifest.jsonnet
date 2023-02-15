{ mainConfig: {
    componentId: "keboola.orchestrator",
    id: ConfigId("social-media-engagement"),
  },
  configurations: std.filter(function(v) v != null,[
    {
      componentId: "keboola.orchestrator",
      id: ConfigId("social-media-engagement"),
      path: "other/keboola.orchestrator/social-media-engagement",
      rows: [],
    },
    if InputIsAvailable("oauth-linkedinads") then
    {
      componentId: "kds-team.ex-linkedin-pages",
      id: ConfigId("data-source-in-social-media-engagement-linkedin-pages"),
      path: "extractor/kds-team.ex-linkedin-pages/data-source-in-social-media-engagement-linkedin-pages",
      rows: [
        {
          id: ConfigRowId("linked-in-page"),
          path: "rows/linked-in-page",
        },
        {
          id: ConfigRowId("linked-in-posts"),
          path: "rows/linked-in-posts",
        },
        {
          id: ConfigRowId("organizations"),
          path: "rows/organizations",
        },
        {
          id: ConfigRowId("share"),
          path: "rows/share",
        },
        {
          id: ConfigRowId("share-lifetime"),
          path: "rows/share-lifetime",
        },
      ],
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.ex-facebook",
      id: ConfigId("data-source-in-social-media-engagement-facebook-pages"),
      path: "extractor/keboola.ex-facebook/data-source-in-social-media-engagement-facebook-pages",
      rows: [],
    },
    if InputIsAvailable("oauth-instagram") then
    {
      componentId: "keboola.ex-instagram",
      id: ConfigId("data-source-in-social-media-engagement-instagram"),
      path: "extractor/keboola.ex-instagram/data-source-in-social-media-engagement-instagram",
      rows: [],
    },
    if InputIsAvailable("oauth-twitter") then
    {
      componentId: "keboola.ex-twitter",
      id: ConfigId("data-source-in-social-media-engagement-twitter"),
      path: "extractor/keboola.ex-twitter/data-source-in-social-media-engagement-twitter",
      rows: [],
    },
    if InputIsAvailable("oauth-youtube") then
    {
      componentId: "keboola.ex-youtube",
      id: ConfigId("data-source-in-social-media-engagement-youtube"),
      path: "extractor/keboola.ex-youtube/data-source-in-social-media-engagement-youtube",
      rows: [],
    },
    if InputIsAvailable("oauth-facebookads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-social-media-engagement-facebook"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-social-media-engagement-facebook",
      rows: [],
    },
    if InputIsAvailable("oauth-instagram") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-social-media-engagement-instagram"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-social-media-engagement-instagram",
      rows: [],
    },
    if InputIsAvailable("oauth-linkedinads") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-social-media-engagement-linkedin"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-social-media-engagement-linkedin",
      rows: [],
    },
    if InputIsAvailable("oauth-twitter") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-social-media-engagement-twitter"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-social-media-engagement-twitter",
      rows: [],
    },
    if InputIsAvailable("oauth-youtube") then
    {
      componentId: "keboola.snowflake-transformation",
      id: ConfigId("transformation-in-social-media-engagement-youtube"),
      path: "transformation/keboola.snowflake-transformation/transformation-in-social-media-engagement-youtube",
      rows: [],
    },
    if InputIsAvailable("wr-db-mysql-db-host") then
    {
      componentId: "keboola.wr-db-mysql",
      id: ConfigId("data-destination-out-social-media-engagement-mysql"),
      path: "writer/keboola.wr-db-mysql/data-destination-out-social-media-engagement-mysql",
      rows: [
        {
          id: ConfigRowId("pages-engagement"),
          path: "rows/pages-engagement",
        },
        {
          id: ConfigRowId("posts-engagement"),
          path: "rows/posts-engagement",
        },
      ],
    },
    if InputIsAvailable("wr-db-pgsql-db-host") then
    {
      componentId: "keboola.wr-db-pgsql",
      id: ConfigId("data-destination-out-social-media-engagement-postgresql"),
      path: "writer/keboola.wr-db-pgsql/data-destination-out-social-media-engagement-postgresql",
      rows: [
        {
          id: ConfigRowId("pages-engagement-001"),
          path: "rows/pages-engagement-001",
        },
        {
          id: ConfigRowId("posts-engagement-001"),
          path: "rows/posts-engagement-001",
        },
      ],
    },
    if InputIsAvailable("google-sheet-id") then
    {
      componentId: "keboola.wr-google-sheets",
      id: ConfigId("data-destination-out-social-media-engagement-sheets"),
      path: "writer/keboola.wr-google-sheets/data-destination-out-social-media-engagement-sheets",
      rows: [],
    },
    if InputIsAvailable("wr-snowflake-db-host") then
    {
      componentId: SnowflakeWriterComponentId(),
      id: ConfigId("data-destination-out-social-media-engagement-snowflake"),
      path: "writer/keboola.wr-snowflake-blob-storage/data-destination-out-social-media-engagement-snowflake",
      rows: [
        {
          id: ConfigRowId("pages-engagement-002"),
          path: "rows/pages-engagement-002",
        },
        {
          id: ConfigRowId("posts-engagement-002"),
          path: "rows/posts-engagement-002",
        },
      ],
    },
  ]),
}
