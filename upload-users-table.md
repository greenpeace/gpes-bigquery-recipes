# How to upload the users table

## 1 - Export the users from Engaging Networks

Use the Engaging Networks Export Group: **LOPD delete**. It has this fields:

* Supporter_ID
* Date_Created
* Date_Modified
* Suppressed
* email
* first_name
* id_number
* phone_number
* tipo
* last_name
* contact_codes
* SFDC_Contact_ID
* SFDC_Lead_ID

If necessary split the file by date, as Engaging Networks does not allow the download of large files.

## 2 - Upload the csv to Google Storage

With **Cyberduck**, upload the csv file(s) to a private Google Storage Bucket. Point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/spain-users.csv
```

## 3 - Create a Google Bigquery table from the bucket

Allow for one million errors and adjust the schema manually if you have too many errors. Making each field a string and checking the boxes will help.

```text
Supporter_ID:STRING,Date_Created:STRING,Date_Modified:STRING,Suppressed:STRING,email:STRING,first_name:STRING,id_number:STRING,phone_number:STRING,tipo:STRING,last_name:STRING,contact_codes:STRING,SFDC_Contact_ID:STRING,SFDC_Lead_ID:STRING
```
