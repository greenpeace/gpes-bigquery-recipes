# Count unique petitions

Count unique petitions + mail to target per user from a transactional file.

## Unique signups

To get rid of duplicates, create a unique_signups table with the unique signups from the transactional table by running the following query:

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.unique_signups AS
SELECT
  Campaign_ID,
  Supporter_Email,
  COUNT(Supporter_Email) AS duplicates_email_petition,
  MAX(Campaign_Date) AS last_signup_date_this_petition
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
```

## Count

From that unique_signups table, count the number of times each email has showned up. This will be the number of unique petitions signed by the user in the previous period.

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.signups_per_user AS
SELECT
  Supporter_Email,
  COUNT (Supporter_Email) AS total_signups,
  MAX(last_signup_date_this_petition) AS last_signup_date_all_petitions
FROM
  spain.unique_signups
  GROUP BY Supporter_Email
ORDER BY
  COUNT(Supporter_Email) DESC;
```

The table signups_per_user will contain the emails addresses with number of signups per user