# Delete inactive users

At first sight this looks similar to Engaging's score 0 criteria. However you can fully control and modify the criteria in the query bellow and easily cross data with other sources like for example your own telemarketing results.

## Mark for deletion latter

Bellow a recipe to select the inactive users (without taking into consideration the opt-outs).

This selection must be uploaded to Engaging Networks so you can send one last recovery email.

```sql
#standardSQL
SELECT
  email, 1 AS candidate_to_delete
FROM
  `spain.users`
WHERE
  tipo = '1' /* Just leads */
  AND total_signups = 0
  AND total_opens = 0
  AND total_clicks = 0
  AND (Date_Created BETWEEN '2014-03-21'
    AND '30-05-2017');
```

Save the results of the previous query as a table in BigQuery.

Export the table to Google Cloud Strorage. You must point to a Bucket. In our case it would be:

```text
gs://gpes-bigquery-files/candidates_to_delete.csv
```

Download with Cyberduck from Google Cloud Storage.

In Engaging Networks (account settings > account data structure) create a text field t store the candidates. For example DELETE_CANDIDATES_2018

Import the candidates_to_delete.csv mapping the field candidate_to_delete to DELETE_CANDIDATES_2018
