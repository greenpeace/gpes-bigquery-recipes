/*

ID numbers that show up more than once in the database

*/
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.id_number_more_than_once AS
SELECT
  *
FROM
  `spain.users`
WHERE
  id_number IN (
  SELECT
    id_number
  FROM
    `spain.users`
  GROUP BY
    id_number
  HAVING
    COUNT(`id_number`) > 1
    AND id_number <> '')
ORDER BY
  id_number;


/*

Have both a contact ID and lead ID

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.id_number_more_than_once AS
SELECT
  *
FROM
  `spain.users`
WHERE
  SFDC_Contact_ID <> ''
  AND SFDC_Lead_ID <> '';

