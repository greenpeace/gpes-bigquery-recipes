# Other reports

## Multiple ID numbers

Creates a table with records that have an ID number that show up more than once in the database.

```sql
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
```

## Contact ID and Lead ID

Creates a table with records that have both a contact ID and a lead ID.
This can be compared with Salesforce to check if the user is a contact or a lead.

```sql
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
```
