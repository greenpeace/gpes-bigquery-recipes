# How to upload the email opens and clics (transactional)

## 1 - Query and export in EN

1. Make a query with the email opens and clics you want to check
2. Export this query as a transactional file
3. Download the csv file from EN

## 2 - Upload the csv to Google Storage

Rename the csv as spain-email-transactional.csv

With **Cyberduck**, upload the csv file(s) to a private Google Storage Bucket. In our case it's named **gpes-bigquery-files**.

## 3 - Create a data set

If it doesn't exist create the **spain** dataset.

In the dataset create a table from Google Cloud storage. Point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/spain-email-transactional.csv
```

As a destination table name, choose **mails**.

If there's errors adjust the schema.

## 4 - Clean

First delete the CSV files from Google Cloud Storage.
