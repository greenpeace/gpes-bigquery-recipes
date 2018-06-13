/*

COUNT UNIQUE PETITIONS + MAIL TO TARGET PER USER FROM A TRANSACTIONAL FILE.

*/


/*

To get rid of duplicates, create a unique_signups table with the unique signups from the transactional table by running the following query:

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.unique_signups AS
SELECT
  Campaign_ID,
  Supporter_Email,
  COUNT(Supporter_Email) AS duplicates_email_petition
FROM
  spain.petitions
WHERE
  (Campaign_Type = 'PET'
    OR Campaign_Type = 'ETT'
    OR Campaign_Type = 'DCF')
  AND (Campaign_Date BETWEEN '2017-06-01'
    AND '2018-06-30')
GROUP BY
  Campaign_ID,
  Supporter_Email
ORDER BY
  COUNT(Campaign_ID) DESC;

/*

From that unique_signups table, count the number of times each email has showned up. This will be the number of unique petitions signed by the user in the previous period.

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.signups_per_user AS
SELECT
  Supporter_Email,
  COUNT (Supporter_Email) AS total_signups
FROM
  spain.unique_signups
  GROUP BY Supporter_Email
ORDER BY
  COUNT(Supporter_Email) DESC;

-- The table signups_per_user will contain the emails addresses with number of signups per user