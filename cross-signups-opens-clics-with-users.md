# How to cross user information with signups, opens and clicks

You shouldn't just upload the results from the transactional files. If you do it, it may upload email addresses that shouldn't be added to your EN database.

By crossing the opens and clics with a recent version of the user database, you'll ensure that you don't upload new email addresses to EN.

## Signups

Cross the current users database with the number of SIGNUPS per user.

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.signups_final AS
SELECT
  users.email,
  signups_per_user.total_signups,
  signups_per_user.last_signup_date_all_petitions
FROM
  spain.users
INNER JOIN
  spain.signups_per_user
ON
  users.email = signups_per_user.Supporter_Email;
```

Download the signups_final table as a csv and upload it to Engaging Networks.

## Opens

Cross the current users database with the number of OPENS per user.

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.opens_final AS
SELECT
  users.email,
  opens_per_user.total_opens,
  opens_per_user.last_email_open_date_all_emails
FROM
  spain.users
INNER JOIN
  spain.opens_per_user
ON
  users.email = opens_per_user.Supporter_Email;
```

Download the opens_final table as a csv and upload it to Engaging Networks.

## Clicks

Cross the current users database with the number of CLICKS per user.

```sql
#standardSQL
CREATE TABLE IF NOT EXISTS
  spain.clicks_final AS
SELECT
  users.email,
  clicks_per_user.total_clicks,
  clicks_per_user.last_email_click_date_all_emails
FROM
  spain.users
INNER JOIN
  spain.clicks_per_user
ON
  users.email = clicks_per_user.Supporter_Email;
```

Download the clicks_final table as a csv and upload it to Engaging Networks.
