/*

REMOVE FROM SPAIN USERS UPDATED USERS

To prevent deleting users that have signed up opened or clicked after the transactional file.

*/


#standardSQL
DELETE
FROM
  `spain.users`
WHERE
  Date_Modified > '2018-06-13';


-- To calculate 2018-06-13 use the MAX date from your transactional file