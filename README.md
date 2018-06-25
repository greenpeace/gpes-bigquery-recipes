# BigQuery recipes

<!-- TOC -->

- [BigQuery recipes](#bigquery-recipes)
    - [**Upload data** to BigQuery](#upload-data-to-bigquery)
        - [From Engaging Networks](#from-engaging-networks)
        - [From Salesforce](#from-salesforce)
    - [Process **signups and messages per user** from an Engaging Networks transactional file](#process-signups-and-messages-per-user-from-an-engaging-networks-transactional-file)
    - [Store permanent minimum transactional files](#store-permanent-minimum-transactional-files)
    - [Other checks](#other-checks)
    - [Other](#other)
    - [Notes](#notes)

<!-- /TOC -->

This repository contains **[Google BigQuery](https://bigquery.cloud.google.com/)** recipes to Analyse our data. To know more about Google BigQuery, watch [this video](https://www.youtube.com/watch?v=eyBK9nj-7AA).

We are starting to use BigQuery for a few maintenace and Analytics tasks as it can quickly process large ammounts of information.

Most of our recipes use data exported from Engaging Networks. User data and transactional data (petition signups, email opens and email clicks).

## **Upload data** to BigQuery

- **[Getting started](prepare-to-bigquery.md)** - Access to Google Cloud, create a dataset, create a bucket, csv file uploads.

### From Engaging Networks

Transactional files that you created yourself:

1. [Upload petition signups](upload-petitions-transactional.md) - Export, csv upload and create a table.
2. [Upload email opens and clics](upload-mails-transactional.md) - Ibid.

Transactional files created by EN for you:

1. [Upload a custom transactional file created by Engaging Networks support](upload-custom-transactional.md) - Download from Egnyte, upload and create a table.

User table and questions:

1. [Upload the users table](upload-users-table.md) - Export, csv upload and create a table.
2. [Upload the email opt-outs](upload-optouts.md) - Ibid.

### From Salesforce

- [Upload report](upload-from-salesforce.md) - Notes on how to upload a report as a csv.
- [Upload telemarketing](upload-telemarketing.md) - How to upload phone call results.

## Process **signups and messages per user** from an Engaging Networks transactional file

After uploading data to Engaging Networks:

If you have created the transactional files yourself:

1. [Count the number of **petitions** per user from a self-downloaded petitions transactional file](count-petitions-per-user-from-transactional.md)
2. [Count the number of **email opens** and **clics** per user from a self-downloaded emails transactional file](count-messages-per-user-from-transactional.sql)

If EN has created the transactional files for you:

1. [Count the number of of **petitions**, **opens** and **clicks** per user from a **custom provided** full transactional file](process-custom-transactional.md)

And then:

1. [**Cross** the users database with the number of petitions per user, number of opens per user and number of clicks per user](cross-signups-opens-clics-with-users.md) (To ensure that you are not adding new users from the transactional files)
2. [Add petitions, opens and clicks data to the users table](enhance-users-table.md) (To make the queries and results easier to handle)
3. [Finetune by removing updated users](tune-updated-users.md) (So that there's no false "zero participation" users if the transactional files aren't as recent)

## Store permanent minimum transactional files

Minimum transactional tables are tables created to store event data in the **long term**. This transactional tables are usually created by removing fields from default transactional tables.

They can and should be **appended** with information about new events, instead of creatting new tables.

- For now we have a table for **Engaging Networks** transactional data: [en_transactional_archive](en_transactional_archive.md) It stores opens and clicks in emails, petition and cyberaction signups and answers to questions.

This tables can be crossed with user tables that contain user personal data and foreign keys.

## Other checks

Things you can check from the Engaging Networks user file:

- [Check invalid fields in the users table](check-invalid-from-users.md) - ID numbers and phone numbers
- [Other reports and checks](other-reports.md) - Multiple ID numbers and inconsistent records.

## Other

- [Utilities](utilities.md) - Convert emails to sha256, records without ID number or phone...
- [Delete inactive users](delete-inactive.md) - Delete users that didn't open, clicked an email or signed up a petition in the last 12 months.

## Notes

- With the code in this repository, you should always use BigQuery Standard SQL.
