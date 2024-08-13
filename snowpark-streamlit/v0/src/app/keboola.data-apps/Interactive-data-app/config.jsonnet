{
    parameters: {
    dataApp: {
      slug: "interactive-data-app",
      streamlit: {
        "config.toml": '[theme]\nthemeName = "keboola"\nfont = "sans serif"\ntextColor = "#222529"\nbackgroundColor = "#FFFFFF"\nprimaryColor = "#1F8FFF"',
      },
      git: {
        branch: "master",
        entrypoint: "main.py",
        repository: "https://github.com/aalteirac/streamlit_keboola_vhol_pc.git"
      },
      "secrets": {
        "user": "",
        "password": "",
        "account": "",
        "warehouse": "PC_KEBOOLA_WH",
        "db_name": "PC_KEBOOLA_DB",
        "schema_name": "PUBLIC",
        "keboola_key": ""
      }
    }
  },
  authorization: {
    app_proxy: {
      auth_providers: [
        {
          id: "simpleAuth",
          type: "password"
        }
      ],
      auth_rules: [
        {
          type: "pathPrefix",
          value: "/",
          auth_required: true,
          auth: [
            "simpleAuth"
          ]
        }
      ]
    }
  }
}
