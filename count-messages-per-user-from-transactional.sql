/*

COUNT UNIQUE EMAIL OPENS + CLICS PER USER FROM A TRANSACTIONAL FILE.

*/

/*

To get rid of duplicates, create a unique_opens table with the unique opens from the transactional table by running the following query:

*/

SELECT
  Campaign_ID,
  email,
  COUNT(email) AS number_of_email_opens
FROM
  learn.mails
WHERE
  Campaign_Type = 'EBC'
  AND (Campaign_Date BETWEEN '2018-06-09'
    AND '2018-06-11')
  AND Campaign_Data_1 = 'open'
GROUP BY
  Campaign_ID,
  email
ORDER BY
  COUNT(Campaign_ID) DESC;


/*

From that unique_opens table, count the number of times each email has showned up. This will be the number of unique petitions signed by the user in the previous period.

*/

SELECT
  email,
  COUNT (email) AS total_opens
FROM
  learn.unique_opens
  GROUP BY email
ORDER BY
  COUNT(email) DESC;

/*

To get rid of duplicates, create a unique_clicks table with the unique clics from the transactional table by running the following query:

*/


SELECT
  Campaign_ID,
  email,
  COUNT(email) AS email_with_click_same_email
FROM
  learn.mails
WHERE
  Campaign_Type = 'EBC'
  AND (Campaign_Date BETWEEN '2018-06-09'
    AND '2018-06-11')
  AND Campaign_Data_1 = 'open'
  AND Campaign_Data_2 = 'click'
GROUP BY
  Campaign_ID,
  email
ORDER BY
  COUNT(Campaign_ID) DESC;


/*

From that unique_clicks table, count the number of times each email has showned up. This will be the number of unique emails with click by the user in the previous period.

*/

SELECT
  email,
  COUNT (email) AS total_clicks
FROM
  learn.unique_clicks
GROUP BY
  email
ORDER BY
  COUNT(email) DESC;

