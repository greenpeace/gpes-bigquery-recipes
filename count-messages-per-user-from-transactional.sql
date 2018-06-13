/*

COUNT UNIQUE EMAIL OPENS + CLICS PER USER FROM A TRANSACTIONAL FILE.

*/

/*

To get rid of duplicates, create a unique_opens table with the unique opens from the transactional table by running the following query:

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.unique_opens AS
SELECT
  Campaign_ID,
  Supporter_Email,
  COUNT(Supporter_Email) AS number_of_email_opens
FROM
  spain.mails
WHERE
  Campaign_Type = 'EBC'
  AND (Campaign_Date BETWEEN '2018-06-09'
    AND '2018-06-11')
  AND Campaign_Data_1 = 'open'
GROUP BY
  Campaign_ID,
  Supporter_Email
ORDER BY
  COUNT(Campaign_ID) DESC;


/*

From that unique_opens table, count the number of times each email has showned up. This will be the number of unique petitions signed by the user in the previous period.

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.opens_per_user AS
SELECT
  Supporter_Email,
  COUNT (Supporter_Email) AS total_opens
FROM
  spain.unique_opens
  GROUP BY Supporter_Email
ORDER BY
  COUNT(Supporter_Email) DESC;


-- The table opens_per_user will contain the emails addresses with number of opens per user

/*

To get rid of duplicates, create a unique_clicks table with the unique clics from the transactional table by running the following query:

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.unique_clicks AS
SELECT
  Campaign_ID,
  Supporter_Email,
  COUNT(Supporter_Email) AS email_with_click_same_email
FROM
  spain.mails
WHERE
  Campaign_Type = 'EBC'
  AND (Campaign_Date BETWEEN '2018-06-01'
    AND '2018-06-13')
  AND Campaign_Data_1 = 'open'
  AND Campaign_Data_2 = 'click'
GROUP BY
  Campaign_ID,
  Supporter_Email
ORDER BY
  COUNT(Campaign_ID) DESC;


/*

From that unique_clicks table, count the number of times each email has showned up. This will be the number of unique emails with click by the user in the previous period.

*/

#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.clicks_per_user AS
SELECT
  Supporter_Email,
  COUNT (Supporter_Email) AS total_clicks
FROM
  spain.unique_clicks
GROUP BY
  Supporter_Email
ORDER BY
  COUNT(Supporter_Email) DESC;

-- The table clicks_per_user will contain the emails addresses with number of clicks per user