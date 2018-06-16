# How to upload the users table

Uploading the user's table is important as, apart from containing important information, it's the table other tables relate to.

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

1. 21/03/2014 to 31/12/2015 - spain-users-1.csv
2. 1/1/2016 to 31/7/2017 - spain-users-2.csv
3. 1/8/2017 to 12/6/2018 - spain-users-3.csv

## 2 - Upload the (3) csvs to Google Storage

With **Cyberduck**, upload the csv file(s) to your Google Storage Bucket. In our case it's named **gpes-bigquery-files**.

## 3 - Create a table and upload

In the **spain** dataset create a table named **users** from Google Cloud storage. Point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/*.csv
```

Allow for a few dozen errors and adjust the schema manually if you have too many errors. Making each field a string and checking the boxes will help.

Here's our schema:

```text
Supporter_ID:STRING,Date_Created:STRING,Date_Modified:STRING,Suppressed:STRING,email:STRING,first_name:STRING,id_number:STRING,phone_number:STRING,tipo:STRING,last_name:STRING,contact_codes:STRING,SFDC_Contact_ID:STRING,SFDC_Lead_ID:STRING
```

## 4 - Clean

First delete the **CSV files** from Google Cloud Storage.

You may need to clean some lines on the **users table** with the Query:

```sql
DELETE
FROM
  `spain.users`
WHERE
  email = 'email';
```

In Engaging Networks the users table hasn't  the date in thw yyyy-mm-dd format. If you want to **transform the dates** to the yyyy-mm-dd format, do the following queries:

For the **created record** date:

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

For the **modified record** date:

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
