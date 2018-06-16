# BigQuery recipes

This repository contains **[Google Big Query](https://bigquery.cloud.google.com/)** recipes to Analyse our data. To know more about Google Big Query, watch [this video](https://www.youtube.com/watch?v=eyBK9nj-7AA).

It’s mainly recipes to use with data exported from Engaging Networks. User data and transactional data (petition signups, email opens and email clicks).

## How to **upload data** to Big Query

From Engaging Networks:

* [Getting started](prepare-to-bigquery.md)
* [Upload petitions (transactional)](upload-petitions-transactional.md)
* [Upload email opens and clics (transactional)](upload-mails-transactional.md)
* [Upload the users table (users)](upload-users-table.md)

## Count **petitions and messages per user** from an Engaging Networks transactional file

After uploading data to Engaging Networks:

1. [Count the number of **petitons** per user from a transactional file](count-petitions-per-user-from-transactional.sql)
2. [Count the number of **email opens** and **clics** per user from a transactional file](count-messages-per-user-from-transactional.sql)
3. [**Cross** the users database with the number of petitions per user, number of opens per user and number of clicks per user](cross-signups-opens-clics-with-users.sql)

## Checks

Things you can check from the Engaging Networks user file:

* [Check invalid fields in the users table](check-invalid-from-users.sql)
* [Other reports and checks](other-reports.sql)

## Other

* [Utilities](utilities.sql)

## Notes

* With the code in this repository, you should always use Big Query Standard SQL.