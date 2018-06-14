/*

Creaes a table with invalid ID numbers

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.invalid_dni AS
SELECT
  email,
  id_number
FROM
  `spain.users`
WHERE
  NOT REGEXP_CONTAINS(id_number, '^[A-z]?[0123456789]{7,8}[TRWAGMYFPDXBNJZSQVHLCKEtrwagmyfpdxbnjzsqvhlcke]$')
  AND id_number <> '';


/*

Creates a table with valid but lowercased ID numbers to uppercase

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.uppercased_dni AS
SELECT
  email,
  UPPER(id_number) AS fixed_dni
FROM
  `spain.users`
WHERE
  REGEXP_CONTAINS(id_number, '^[A-z]?[0123456789]{7,8}[trwagmyfpdxbnjzsqvhlcke]$')
  AND id_number <> '';

/*

Invalid phone numbers or formats

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.invalid_phones AS
SELECT
  email,
  phone_number
FROM
  `spain.users`
WHERE
  NOT REGEXP_CONTAINS(phone_number, '^[6789][0123456789]{8}$')
  AND phone_number <> '';
