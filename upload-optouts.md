# How to upload the email opt-outs

The email opt-outs are stored as a question in Engging Networks.

## 1 - Query and export in EN

1. Make an export query with everyone that has opted out (or everyone that has opted in)
2. Export this query as a user file (the email field is enough)
3. Download the csv file from EN

## 2 - Upload the csv to Google Storage

Rename the csv as **email-opt-outs.csv**

With **Cyberduck**, upload the csv file to your Google Storage Bucket. In our case it's named **gpes-bigquery-files**.

## 3 - Create a table and upload

In the **spain** dataset create a table named **email_opt_outs** from Google Cloud storage. Point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/email-opt-outs.csv
```

## 4 - Clean

Delete the **CSV file** from Google Cloud Storage.

## 5 - Cross the opt-out information with the users table

You can have the opt-out information crossed with the user information, to simplify queries.

First add a new string field to the users table with the name **wants_to_receive_emails**.

Now cross the users table with the opt-outs table with the query:

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.wants_to_receive_emails = 'N'
FROM
  `spain.email_opt_outs` b
WHERE
  a.email = b.email;
```

Finally you can make the `null` values as `Y`, to simplify the queries:

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.wants_to_receive_emails = 'Y'
WHERE
  a.wants_to_receive_emails IS NULL;
```

If you do opt-in lists instead of opt-out, just adjust the SQL queries above.

## Important note

Please note that this process can be adapted to cross opt-out information from other channels. You can adjust it to add opt-out information from phone calls for example. In this case, the field used to cross will be the phone number, instead of the email. Unlike with Engaging Networks you can use any field to opt-out.
