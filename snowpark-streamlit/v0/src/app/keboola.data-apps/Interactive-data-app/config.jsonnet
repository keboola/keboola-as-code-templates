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
        "warehouse": "",
        "db_name": "",
        "schema_name": "",
        "keboola_key": ""
      }
    }
  }
}
