{
    parameters: {
    dataApp: {
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
        "schema_name": "",
        "keboola_key": ""
      }
    }
  }
}
