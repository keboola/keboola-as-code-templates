The Flow in a nutshell:
- Provide storage token which has specified rights to view and/or edit specific buckets, folders in keboola storage. Creation of such token is located within settings.
- Define the field/column limitations within the Python code of the App.
- Deploy the App. 

Within the Data App:
- Business users will be able to select a table for editing.
- Once the edits are done, hit the “Save“ button and the changes will instantly be saved back into the table in Keboola Storage via full load or incremental load when primary keys are set.

For more information, take a look at our [documentation](https://help.keboola.com/templates/interactive-keboola-sheets/).