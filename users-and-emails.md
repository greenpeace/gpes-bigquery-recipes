# Know the most active users and the emails they interacted with

Can be used to investigate hyper-participative users, suspecting they can be bots. We don't send more than 100 emails to a user in a year, so this is not what it looks like.

## Opens per user

First you need to create a copy of **opens_per_user** named **opens_per_user_2** because BigQuery complains if you try to cross fields with the same name in two different tables.

```sql
#standardSQL
SELECT
  Supporter_Email,
  a.total_opens,
  b.Campaign_ID
FROM
  `spain.opens_per_user_2` a
RIGHT JOIN
  `spain.unique_opens` b
ON
  a.email = b.Supporter_Email
WHERE
a.total_opens > 100
ORDER BY a.total_opens DESC;
```

## Clicks per user

First you need to create a copy of **clicks_per_user** named **clicks_per_user_2** because BigQuery complains if you try to cross fields with the same name in two different tables.

```sql
#standardSQL
SELECT
  Supporter_Email,
  a.total_clicks,
  b.Campaign_ID
FROM
  `spain.clicks_per_user_2` a
RIGHT JOIN
  `spain.unique_clicks` b
ON
  a.email = b.Supporter_Email
WHERE
a.total_clicks > 100
ORDER BY a.total_clicks DESC;
```
