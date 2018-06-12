# BigQuery recipes

This repository contains Google Big Query recipes to Analyse our data.

Always use Big Query Standard SQL.

## Count petitions and messages per user from transactional

* Count the number of petitons per user from a transactional file. [Go](count-petitions-per-user-from-transactional.sql)
* Count the number of email opens and clics per user from a transactional file. [Go](count-messages-per-user-from-transactional.sql)

## Upload the users table

### Upload data to Google Storage

With Cyberduck, upload the csv file(s) to a private Google Storage Bucket.

```text
gs://gpes-bigquery-files/spain-users.csv
```

### Create a table from the bucket

Allow for one million errors and adjust the schema manually if you have too many errors. Making each field a string and checking the boxes will help.

Schema for users (LOPD delete):

```text
Supporter_ID:STRING,Date_Created:STRING,Date_Modified:STRING,Suppressed:STRING,email:STRING,first_name:STRING,id_number:STRING,phone_number:STRING,tipo:STRING,last_name:STRING,contact_codes:STRING,SFDC_Contact_ID:STRING,SFDC_Lead_ID:STRING
```
