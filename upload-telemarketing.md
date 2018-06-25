# Upload telemarketing results

This page describes a recipe to upload all telemarketing phone calls to Big Query.

## Create a report in Salesforce with the neccessary fields

The Salesforce report has this fields:

```text
Id de miembro
Id de candidato/contacto
Id de campaña
Teléfono
Teléfono móvil
Call Result Date
Response Code
```

Our report is [here](https://eu15.salesforce.com/00O1p000004nfzJ).

## Upload the file(s) to Salesforce

Please see the [upload from Salesforce page](upload-from-salesforce.md) for more information on how to upload data from Salesforce.

In the **spain** dataset, create a table named **telemarketing_temp** and load it with the telemarketing csvs from Salesforce.

This is the schema to use:

```text
Id__de_miembro:STRING,Id__de_candidato_contacto:STRING,Id__de_campa__a:STRING,Tel__fono:STRING,Tel__fono_m__vil:STRING,Call_Result_Date:DATE,Response_Code:STRING
```

All the fields are strings except for **Call_Result_Date** that is a date.

Please check if the information is correctly loaded into the temporary file.

## Add the temporary table to an archive table

The table **telemarketing_campaigns** is where we permanently store information about telemarketing calls. The table **telemarketing_temp** should be appended to this table after being checked and uploaded.

This table has the fields:

```text
Campaign_Member_ID
Contact_Lead_ID
Campaign_ID
Phone
Call_Result_Date (DATE)
Response_Code
```

This is the schema:

```text
Campaign_Member_ID:STRING,Contact_Lead_ID:STRING,Campaign_ID:STRING,Phone:STRING,Call_Result_Date:DATE,Response_Code:STRING
```

To add the **telemarketing_temp** to **telemarketing_campaigns** use this SQL code.

```sql
INSERT INTO spain.telemarketing_campaigns (
    Campaign_Member_ID,
    Contact_Lead_ID,
    Campaign_ID,
    Phone,
    Call_Result_Date,
    Response_Code
    )
SELECT
    Id__de_miembro,
    Id__de_candidato_contacto,
    Id__de_campa__a,
    SAFE_CAST(Tel__fono AS String),
    Tel__fono_m__vil,
    Call_Result_Date,
    Response_Code
FROM spain.telemarketing_temp;
```
