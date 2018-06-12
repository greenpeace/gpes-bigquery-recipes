/*

ON THIS DOC WE SHOW EXAMPLES ON HOW TO CROSS USER INFORMATION WITH SIGNUPS, OPENS AND CLICS

You shouldn't just upload the results from the transactional files. If you do it, it will upload email addresses that can't be added to the database.

If you cross the opens and clics with the user database, you'l ensure that you don't upload new email addresses to EN.

*/

/*

Cross the current users database with the number of SIGNUPS per user from the transctional file

*/

#standardSQL
SELECT
  users.email,
  signups_per_user.total_signups
FROM
  spain.users
LEFT JOIN
  spain.signups_per_user
ON
  users.email = signups_per_user.email
WHERE
  signups_per_user.total_signups IS NOT NULL;


-- Export the result and upload it to Engaging Networks.


/*

Cross the current users database with the number of OPENS per user from the transctional file

*/

#standardSQL
SELECT
  users.email,
  opens_per_user.total_opens
FROM
  spain.users
LEFT JOIN
  spain.opens_per_user
ON
  users.email = opens_per_user.email
WHERE
  opens_per_user.total_opens IS NOT NULL;


-- Export the result and upload it to Engaging Networks.


/*

Cross the current users database with the number of CLICKS per user from the transctional file

*/

#standardSQL
SELECT
  users.email,
  clicks_per_user.total_clicks
FROM
  spain.users
LEFT JOIN
  spain.clicks_per_user
ON
  users.email = clicks_per_user.email
WHERE
  clicks_per_user.total_clicks IS NOT NULL;


-- Export the result and upload it to Engaging Networks.
