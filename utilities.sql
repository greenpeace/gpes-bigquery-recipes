/*

Convert emails to sha256 (Adwords and Facebook Ads)

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.email_as_sha256 AS
SELECT
  TO_HEX(SHA256(email)) AS email_sha256
FROM
  `spain.users`;

/*

Leads without phone number

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