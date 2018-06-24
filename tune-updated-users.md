# Remove updated users from the Spain dataset

This is to prevent counting with users that couldn't be in the transactional files because the user files were generated latter.

```sql
#standardSQL
DELETE
FROM
  `spain.users`
WHERE
  Date_Modified > '2018-06-13';
```

To calculate 2018-06-13 use the MAX date from your transactional file.