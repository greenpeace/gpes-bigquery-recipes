# BigQuery recipes

This repository contains Google Big Query recipes to Analyse our data.

Please note that, with the code in this repository, you should always use Big Query Standard SQL.

To know more about Google Big Query, watch [this video](https://www.youtube.com/watch?v=eyBK9nj-7AA).

## How to upload data to Big Query

* [Upload petitions transactional](upload-petitions-transactional.md)
* [Upload email opens and clics transactional](upload-mails-transactional.md)
* [Upload the users table](upload-users-table.md)

## Count petitions and messages per user from an Engaging Networks transactional file

1. [Count the number of **petitons** per user from a transactional file](count-petitions-per-user-from-transactional.sql)
2. [Count the number of **email opens** and **clics** per user from a transactional file](count-messages-per-user-from-transactional.sql)
3. [**Cross** the users database with the number of petitions per user, number of opens per user and number of clicks per user](cross-signups-opens-clics-with-users.sql)
