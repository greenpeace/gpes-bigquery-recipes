/*

Convert emails to sha256 
This is useful to use email addresses in Adwords, Facebook and Twitter Ads without sending the email addresses.

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.email_as_sha256 AS
SELECT
  TO_HEX(SHA256(email)) AS email_sha256
FROM
  `spain.users`;

/*

Get a list of leads without phone number

*/

#standardSQL
SELECT
  *
FROM
  `spain.users`
WHERE
  tipo NOT IN ('0',
    '2',
    '3',
    '4',
    '5')
  AND first_name <> ''
  AND last_name <> ''
  AND id_number <> ''
  AND phone_number = '';

/*

Records without ID number

*/

#standardSQL
SELECT
  *
FROM
  `spain.users`
WHERE
  first_name <> ''
  AND last_name <> ''
  AND id_number = '';

