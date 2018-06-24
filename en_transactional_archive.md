# **en_transactional_archive** stores Engaging Networks transactional data

It includes the necessary fields to store data about petitions, questions, email to target, opens and clicks.

## Table fields

```text
Supporter_Email
Campaign_Number
Campaign_Type
Campaign_ID
Campaign_Date
Campaign_Time
Campaign_Status
Campaign_Data_1 (open, dest ett)
Campaign_Data_2 (click, dest ett)
Campaign_Data_3 (click, target in ett)
Campaign_Data_32 (device)
Campaign_Data_33 (URL petition)
utm_source
utm_medium
utm_campaign
utm_content
utm_term
GCLID
ip
uagent
```

## How to create the table

Create a table named **en_transactional_archive** with the following schema:

```text
Supporter_Email:STRING,Campaign_Number:STRING,Campaign_Type:STRING,Campaign_ID:STRING,Campaign_Date:DATE,Campaign_Time:STRING,Campaign_Status:STRING,Campaign_Data_1:STRING,Campaign_Data_2:STRING,Campaign_Data_3:STRING,Campaign_Data_32:STRING,Campaign_Data_33:STRING,utm_source:STRING,utm_medium:STRING,utm_campaign:STRING,utm_content:STRING,utm_term:STRING,GCLID:STRING,ip:STRING,uagent:STRING
```

## Add the **transactional** table to the **en_transactional_archive** table

```sql
standardSQL
INSERT INTO spain.en_transactional_archive (
    Supporter_Email,
    Campaign_Number,
    Campaign_Type,
    Campaign_ID,
    Campaign_Date,
    Campaign_Time,
    Campaign_Status,
    Campaign_Data_1,
    Campaign_Data_2,
    Campaign_Data_3,
    Campaign_Data_32,
    Campaign_Data_33,
    utm_source,
    utm_medium,
    utm_campaign,
    utm_content,
    utm_term,
    GCLID,
    ip,
    uagent
    )
SELECT
    Supporter_Email,
    Campaign_Number,
    Campaign_Type,
    Campaign_ID,
    Campaign_Date,
    Campaign_Time,
    Campaign_Status,
    Campaign_Data_1,
    Campaign_Data_2,
    Campaign_Data_3,
    Campaign_Data_32,
    Campaign_Data_33,
    utm_source,
    utm_medium,
    utm_campaign,
    utm_content,
    utm_term,
    GCLID,
    ip,
    uagent
FROM spain.transactional;
```

If you have records that shouldn't be there because they are out of date, you can use:

```sql
DELETE
FROM
  `spain.en_transactional_archive`
WHERE
  Campaign_Date > '2018-05-31';
```
