# BigQuery recipes

This repository contains **[Google BigQuery](https://bigquery.cloud.google.com/)** recipes to Analyse our data. To know more about Google BigQuery, watch [this video](https://www.youtube.com/watch?v=eyBK9nj-7AA).

It’s mainly recipes to use with data exported from Engaging Networks. User data and transactional data (petition signups, email opens and email clicks).

## How to **upload data** to BigQuery

From Engaging Networks:

* **[Getting started](prepare-to-bigquery.md)** - Access to Google Cloud, create a dataset, create a bucket, csv file uploads.

1. [Upload petition signups](upload-petitions-transactional.md) - Export, csv upload and create a table.
2. [Upload email opens and clics](upload-mails-transactional.md) - Ibid.
3. [Upload the users table](upload-users-table.md)- Ibid.
4. [Upload the email opt-outs](upload-optouts.md) - Ibid.
5. [Upload a custom transactional file created by Engaging Networks support](upload-custom-transactional.md) - Download from Egnyte, upload and create a table.

## Count **petitions and messages per user** from an Engaging Networks transactional file

After uploading data to Engaging Networks:

1. [Count the number of **petitions** per user from a self-downloaded transactional file](count-petitions-per-user-from-transactional.sql)
2. [Count the number of **email opens** and **clics** per user from a self-downloaded transactional file](count-messages-per-user-from-transactional.sql)
3. [Count the number of of **petitions**, **opens** and **clicks** per user from a **custom provided** transactional file](process-custom-transactional.sql)
4. [**Cross** the users database with the number of petitions per user, number of opens per user and number of clicks per user](cross-signups-opens-clics-with-users.sql)
5. [Add petitions, opens and clicks data to the users table](enhance-users-table.md)

## Checks

Things you can check from the Engaging Networks user file:

* [Check invalid fields in the users table](check-invalid-from-users.sql)
* [Other reports and checks](other-reports.sql)

## Other

* [Utilities](utilities.sql)
* [Delete innactive users](delete-inactive.sql) - Delete users that didn't open, clicked an email or signed up a petition in the last 12 months.

## Notes

* With the code in this repository, you should always use BigQuery Standard SQL.
