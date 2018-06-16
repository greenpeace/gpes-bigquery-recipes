# How to upload the petitions (transactional)

## 1 - Query and export in EN

1. Make an export query with all data capture and email to target petitions
2. Export this query as a transactional file
3. Download the csv file from EN

## 2 - Upload the csv to Google Storage

Rename the csv as **spain-petitions-transactional.csv**

With **Cyberduck**, upload the csv file to your Google Storage Bucket. In our case it's named **gpes-bigquery-files**.

## 3 - Create a table and upload

In the **spain** dataset create a table named **petitions** from Google Cloud storage. Point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/spain-petitions-transactional.csv
```

If there's errors adjust the schema.

## 4 - Clean

Delete the **CSV files** from Google Cloud Storage.
