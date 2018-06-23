# BigQuery recipes

This repository contains **[Google BigQuery](https://bigquery.cloud.google.com/)** recipes to Analyse our data. To know more about Google BigQuery, watch [this video](https://www.youtube.com/watch?v=eyBK9nj-7AA).

We are starting to use BigQuery for a few maintenace and Analytics tasks as it can quickly process large ammounts of information.

Most of our recipes use data exported from Engaging Networks. User data and transactional data (petition signups, email opens and email clicks).

## **Upload data** to BigQuery

* **[Getting started](prepare-to-bigquery.md)** - Access to Google Cloud, create a dataset, create a bucket, csv file uploads.

### From Engaging Networks

Transactional files that you created yourself:

1. [Upload petition signups](upload-petitions-transactional.md) - Export, csv upload and create a table.
2. [Upload email opens and clics](upload-mails-transactional.md) - Ibid.

Transactional files created by EN for you:

1. [Upload a custom transactional file created by Engaging Networks support](upload-custom-transactional.md) - Download from Egnyte, upload and create a table.

User and questions:

1. [Upload the users table](upload-users-table.md) - Export, csv upload and create a table.
2. [Upload the email opt-outs](upload-optouts.md) - Ibid.

### From Salesforce

* [Upload report](upload-from-salesforce.md)

## Process **signups and messages per user** from an Engaging Networks transactional file

After uploading data to Engaging Networks continue here.

If you have created the transactional files yourself:

1. [Count the number of **petitions** per user from a self-downloaded petitions transactional file](count-petitions-per-user-from-transactional.sql)
2. [Count the number of **email opens** and **clics** per user from a self-downloaded emails transactional file](count-messages-per-user-from-transactional.sql)

If EN has created the transactional files for you:

1. [Count the number of of **petitions**, **opens** and **clicks** per user from a **custom provided** full transactional file](process-custom-transactional.sql)

And then:

1. [**Cross** the users database with the number of petitions per user, number of opens per user and number of clicks per user](cross-signups-opens-clics-with-users.sql) (To ensure that you are not adding new users from the transactional files)
2. [Add petitions, opens and clicks data to the users table](enhance-users-table.md) (To make the queries and results easier to handle)
3. [Finetune by removing updated users](tune-updated-users.sql) (So that there's no false "zero participation" users if the transactional files aren't as recent)

## Other checks

Things you can check from the Engaging Networks user file:

* [Check invalid fields in the users table](check-invalid-from-users.sql) - ID numbers and phone numbers
* [Other reports and checks](other-reports.sql) - Multiple ID numbers and inconsistent records.

## Other

* [Utilities](utilities.sql) - Convert emails to sha256, records without ID number or phone...
* [Delete inactive users](delete-inactive.sql) - Delete users that didn't open, clicked an email or signed up a petition in the last 12 months.

## Notes

* With the code in this repository, you should always use BigQuery Standard SQL.
