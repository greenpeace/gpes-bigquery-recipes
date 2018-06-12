/*

ON THIS DOC WE SHOW EXAMPLES ON HOW TO CROSS USER INFORMATION WITH SIGNUPS, OPENS AND CLICS
You shouldn't just upload the results from the transactional fileS as it will bring email addresses that can't be added to the database.

*/

/*

Cross the current users database with the number of signups per user from the transctional file

*/

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
  users.tipo = '2'
  AND signups_per_user.total_signups IS NOT NULL;

/*

Export the result and upload it to Engaging Networks.

*/

/*

Cross the current users database with the number of opens per user from the transctional file

*/


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
  users.tipo = '2'
  AND opens_per_user.total_opens IS NOT NULL;


/*

Export the result and upload it to Engaging Networks.

*/


/*

Cross the current users database with the number of clicks per user from the transctional file

*/


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
  users.tipo = '2'
  AND clicks_per_user.total_clicks IS NOT NULL;


/*

Export the result and upload it to Engaging Networks.

*/
