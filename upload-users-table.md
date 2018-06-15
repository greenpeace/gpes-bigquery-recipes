# How to upload the users table

## 1 - Export the users from Engaging Networks

Use the Engaging Networks Export Group: **LOPD delete**. It's a group we have created and that has this fields:

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

If necessary split the file by record created date, as Engaging Networks does not allow the download of large files. Here's what works for us:

* 21/03/2014 to 31/12/2015 - spain-users-1.csv
* 1/1/2016 to 31/7/2017 - spain-users-2.csv
* 1/8/2017 to 12/6/2018 - spain-users-3.csv


## 2 - Upload the csv to Google Storage

With **Cyberduck**, upload the csv file(s) to a private Google Storage Bucket. Point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/*.csv
```

## 3 - Create a Google Bigquery table from the bucket

As a destination table name, choose **users**.

Allow for a few dozen errors and adjust the schema manually if you have too many errors. Making each field a string and checking the boxes will help.

```text
Supporter_ID:STRING,Date_Created:STRING,Date_Modified:STRING,Suppressed:STRING,email:STRING,first_name:STRING,id_number:STRING,phone_number:STRING,tipo:STRING,last_name:STRING,contact_codes:STRING,SFDC_Contact_ID:STRING,SFDC_Lead_ID:STRING
```

You may need to clean some lines:

```sql
DELETE
FROM
  `spain.users`
WHERE
  email = 'email';
```

Finally you may want to transform the dates in the yyyy-mm-dd format, to be able to use them in Queries:

First the created date:

```sql
#standardSQL
UPDATE
  `spain.users`
SET
  Date_Created = SAFE_CAST(PARSE_DATE('%d/%m/%Y',
      Date_Created) AS STRING)
WHERE
  email <> '';
  ```

And then the modified date:

```sql
#standardSQL
UPDATE
  `spain.users`
SET
  Date_Modified = SAFE_CAST(PARSE_DATE('%d/%m/%Y',
      Date_Modified) AS STRING)
WHERE
  email <> ''
  AND Date_Modified <> '';
  ```
