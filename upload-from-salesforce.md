# Upload from Salesforce

We use Salesforce as our CRM.

## 1 - Export the users from Engaging Networks

To bring data from Salesforce to Google Big Query you must first create a report in Salesforce and export it as a CSV.

* Format: CSV
* Charset: UTF-8
* Delimitado por comas, (distinto a la configuración regional).csv

For large volumes you may need to split your file.

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