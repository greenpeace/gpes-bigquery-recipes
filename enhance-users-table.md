# Enhance the users table

## Create new fields in the users table

* total_signups (int)
* last_signup_date_all_petitions (date)
* total_opens (int)
* last_email_open_date_all_emails (date)
* total_clicks (int)
* last_email_click_date_all_emails (date)

Here's the schema as text, just paste it to BigQuery:

```text
total_signups:INTEGER,last_signup_date_all_petitions:DATE,total_opens:INTEGER,last_email_open_date_all_emails:DATE,total_clicks:INTEGER,last_email_click_date_all_emails:DATE
```

## Update the signups

Copy the values from the signups_per_user table to the users table.

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.total_signups = b.total_signups,
  a.last_signup_date_all_petitions = b.last_signup_date_all_petitions
FROM
  `spain.signups_per_user` b
WHERE
  a.email = b.Supporter_Email;
```

And make the empty values as 0:

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.total_signups = 0
WHERE
  a.total_signups IS NULL;
```

## Update the email opens

Copy the values from the opens_per_user table to the users table.

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.total_opens = b.total_opens,
  a.last_email_open_date_all_emails = b.last_email_open_date_all_emails
FROM
  `spain.opens_per_user` b
WHERE
  a.email = b.Supporter_Email;
```

And make the empty values as 0:

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.total_opens = 0
WHERE
  a.total_opens IS NULL;
```

## Update the email clicks

Copy the values from the clicks_per_user table to the users table.

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.total_clicks = b.total_clicks,
  a.last_email_click_date_all_emails = b.last_email_click_date_all_emails
FROM
  `spain.clicks_per_user` b
WHERE
  a.email = b.Supporter_Email;
```

And make the empty values as 0:

```sql
#standardSQL
UPDATE
  `spain.users` a
SET
  a.total_clicks = 0
WHERE
  a.total_clicks IS NULL;
```

## Conclusion

Now you have the user table with all the info you need on opens, clics, signups and opt-out + suppressed state.