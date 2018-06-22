/*

DELETE INACTIVE USERS

*/


/*

Recipe to select the innactive users (without taking into consideration the opt-outs)

This selection must be uploaded to Engaging Networks so you can send one last recovery email.

*/

#standardSQL
SELECT
  email, 1 AS candidate_to_delete
FROM
  `spain.users`
WHERE
  tipo = '1'
  AND total_signups = 0
  AND total_opens = 0
  AND total_clicks = 0
  AND (Date_Created BETWEEN '2014-03-21'
    AND '30-05-2017');

-- Add script to keep the opt-outs

/*

Save the results of the previous query as a table

Export the table to Google Cloud Strorage. You must point to a Bucket. In your ase it would be:

gs://gpes-bigquery-files/candidates_to_delete.csv

Download with Cyberduck.

In Engaging Networks (account settings > account data structure) create a text field t store the candidates. For example DELETE_CANDIDATES_2018

Import the candidates_to_delete.csv mapping the field candidate_to_delete to DELETE_CANDIDATES_2018


*/