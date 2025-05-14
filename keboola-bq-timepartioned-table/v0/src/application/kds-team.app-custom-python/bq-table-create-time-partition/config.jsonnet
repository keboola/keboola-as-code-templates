{
  parameters: {
    "code": "import requests\nimport json\nimport logging\nfrom keboola.component import CommonInterface\n\n# Configure logging\nlogging.basicConfig(\n    level=logging.INFO,\n    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',\n)\nlogger = logging.getLogger(__name__)\n\n\n\n# Get parameters from configuration\nfrom keboola.component import CommonInterface\nci = CommonInterface()\nparameters = ci.configuration.parameters\n\n# Extract parameters from configuration\nSTORAGE_API_TOKEN = parameters.get(\"#storage_api_token\")\nTABLE_NAME = parameters.get(\"table_name\")\nPK_COLUMN_NAME = parameters.get(\"pk_column_name\")\nPK_COLUMN_TYPE = parameters.get(\"pk_column_type\")\nPARTITION_COLUMN_NAME = parameters.get(\"partition_column_name\")\nPARTITION_COLUMN_TYPE = parameters.get(\"partition_column_type\")\nPARTITIONING_TYPE = parameters.get(\"partitioning_type\")\nBUCKET_ID = parameters.get(\"bucket_id\")\nKEBOOLA_URL = parameters.get(\"keboola_url\")\n\n# Print the token for debugging (remove in production)\nprint(f\"Using token: {STORAGE_API_TOKEN}\")\n\n# Construct the URL using the bucket_id parameter\nurl = f\"https://{KEBOOLA_URL}/v2/storage/buckets/{BUCKET_ID}/tables-definition\"\n\n# Construct the payload using parameters\npayload = {\n    \"name\": TABLE_NAME,\n    \"primaryKeysNames\": [PK_COLUMN_NAME],\n    \"columns\": [\n        {\n            \"name\": PK_COLUMN_NAME,\n            \"definition\": \n          \t\t{\"type\": PK_COLUMN_TYPE,\n          \t\t\"nullable\" : False\n            \t}\n        },\n        {\n            \"name\": PARTITION_COLUMN_NAME,\n            \"definition\": {\"type\":PARTITION_COLUMN_TYPE}\n        }\n    ],\n    \"timePartitioning\": {\n        \"type\": PARTITIONING_TYPE,\n        \"field\": PARTITION_COLUMN_NAME\n    }\n}\n\n# Construct headers using the storage_api_token parameter\nheaders = {\n    \"Accept\": \"*/*\",\n    \"Accept-Encoding\": \"gzip, deflate, br\",\n    \"User-Agent\": \"EchoapiRuntime/1.1.0\",\n    \"Connection\": \"keep-alive\",\n    \"Content-Type\": \"application/json\",\n    \"X-StorageApi-Token\": STORAGE_API_TOKEN\n}\n\n# Make the API request\nresponse = requests.post(url, headers=headers, json=payload)\nprint(f\"Status Code: {response.status_code}\")\nprint(f\"Response Text: {response.text}\")",
    packages: [
      "requests",
    ],
    user_properties: {
      "keboola_url": Input("keboola-url"),
      "#storage_api_token": Input("app-custom-python-user-properties-storage-api-token"),
      "bucket_id": Input("bucket-id"),
      "table_name": Input("table-name"),
      "pk_column_name": Input("pk-column-name"),
      "pk_column_type": Input("pk-column-type"),
      "partition_column_name": Input("partition-column-name"),
      "partition_column_type": Input("partition-column-type"),
      "partitioning_type": Input("partitioning-type"),
    },
  },
}
