# Scripts to process a custom transactional file sent by EN

## Signups

### 1st process the unique signups

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
  spain.transactional
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

### 2nd process the signups per user

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

## Opens

### 1st process the unique opens

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.unique_opens AS
SELECT
  Campaign_ID,
  Supporter_Email,
  COUNT(Supporter_Email) AS number_of_email_opens,
  MAX(Campaign_Date) AS last_email_open_date_this_email
FROM
  spain.transactional
WHERE
  Campaign_Type = 'EBC'
  AND Campaign_Data_1 = 'open'
  AND (Campaign_Date BETWEEN '2017-06-01'
    AND '2018-06-30')
GROUP BY
  Campaign_ID,
  Supporter_Email;
```

### 2nd process the opens per user

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS spain.opens_per_user AS
SELECT
  Supporter_Email,
  COUNT (Supporter_Email) AS total_opens,
  MAX(last_email_open_date_this_email) AS last_email_open_date_all_emails
FROM
  spain.unique_opens
GROUP BY
  Supporter_Email
ORDER BY
  COUNT(Supporter_Email) DESC;
```

## Clicks

### 1st process the unique clicks

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.unique_clicks AS
SELECT
  Campaign_ID,
  Supporter_Email,
  COUNT(Supporter_Email) AS email_with_click_same_email,
  MAX(Campaign_Date) AS last_email_click_date_this_email
FROM
  spain.transactional
WHERE
  Campaign_Type = 'EBC'
  AND (Campaign_Date BETWEEN '2017-06-01'
    AND '2018-06-30')
  AND Campaign_Data_1 = 'open'
  AND Campaign_Data_2 = 'click'
GROUP BY
  Campaign_ID,
  Supporter_Email;
```

### 2nd process the clicks per user

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS spain.clicks_per_user AS
SELECT
  Supporter_Email,
  COUNT (Supporter_Email) AS total_clicks,
  MAX(last_email_click_date_this_email) AS last_email_click_date_all_emails
FROM
  spain.unique_clicks
GROUP BY
  Supporter_Email
ORDER BY
  COUNT(Supporter_Email) DESC;
```
