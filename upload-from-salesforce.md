# Upload from Salesforce

We use Salesforce as our CRM. Sometimes it's useful to export dara from Salesforce and analyse it in BigQuery.

## 1 - Export from Salesforce

To bring data from Salesforce to Google Big Query you must first create a report in Salesforce and export it as a CSV.

Use this options:

* Format: CSV
* Charset: UTF-8
* Delimitado por comas, (distinto a la configuración regional).csv

For large volumes you may need to split your file if Salesforce gives you an error.

Please remmember that if the data to upload needs to be crossed latter you should include at least one field that identifies the user. Normally one of the following fields:

1. DNI/NIE
2. Email address
3. Phone number
4. Salesforce contact id or lead id

## 2 - Upload the CSVs to Google Storage

With **Cyberduck**, upload the csv file(s) to your Google Storage Bucket. In our case it's named **gpes-bigquery-files**.

## 3 - Create a table and upload

In the **spain** dataset create a table and name it with a descriptive name. As a source of data point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/*.csv
```

Use this options:

* Write Preference: Write if empty
* Source Format: CSV
* Skip Leading Rows: 1
* Autodetect Schema: true

Please note that if you don't define the schema manually the field names will be Salesforce field names, but tildes spaces and other non-ascii chars will be replaced by underscores.

You can always rerun the job and adjust the schema manually.

## 4 - Clean

Delete the **CSV files** from Google Cloud Storage.
