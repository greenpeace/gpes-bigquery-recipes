/*

Creates a table with records that have an ID number that show up more than once in the database.

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

Creates a table with records that have both a contact ID and a lead ID.
This can be compared with Salesforce to check if the user is a contact or a lead.

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

/*

Creates a table with records that haven't contact codes but have a Salesforce Contact ID.
This can be crossed with Salesforce data and updated.

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.missing_contact_codes AS
SELECT
  *
FROM
  `spain.users`
WHERE
  contact_codes == ''
  AND SFDC_Contact_ID <> '';

/*

After crossing the user's table with the email opt-outs table you can count how many email accounts have decided to opt-out of receiving email.

*/

SELECT
  `receive_emails`,
  COUNT(`receive_emails`) AS total
FROM
  `spain.users`
GROUP BY
  `receive_emails`
ORDER BY
  COUNT(`receive_emails`) DESC;