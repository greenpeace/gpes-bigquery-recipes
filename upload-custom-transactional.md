# How to upload custom transactional files (with all operations)

This is how you upload custom transactional csv files supplied by Engaging Netwoks

## 1 - Ask for the transactional files

1. Ask EN support for the files
2. Download files from egnyte
3. Unzip the csv files

## 2 - Upload the csvs to Google Storage

With **Cyberduck**, upload the csv file(s) to your Google Storage Bucket. In our case it's named **gpes-bigquery-files**.

## 3 - Create a table and upload

In the **spain** dataset create a table named **transactional** from Google Cloud storage. Point to the bucket + file with something like:

```text
gs://gpes-bigquery-files/*.csv
```

You'll need to manually create the schema. To do that, get the headers and a small sample of the file by using this command in your Mac OS or Linux terminal:

```bash
head -n 50 downloaded_file.csv > file_headers_sample.csv
```

Upload `file_headers_sample.csv` to BigQuery and work on the schema. Here's our current schema:

```text
Account_ID:STRING,Supporter_ID:STRING,Supporter_Email:STRING,Date_Created:DATE,Date_Modified:DATE,Campaign_Number:STRING,Campaign_Type:STRING,Campaign_ID:STRING,Campaign_Date:DATE,Campaign_Time:STRING,Campaign_Status:STRING,Campaign_Data_1:STRING,Campaign_Data_2:STRING,Campaign_Data_3:STRING,Campaign_Data_4:STRING,Campaign_Data_5:STRING,Campaign_Data_6:STRING,Campaign_Data_7:STRING,Campaign_Data_8:STRING,Campaign_Data_9:STRING,Campaign_Data_10:STRING,Campaign_Data_11:STRING,Campaign_Data_12:STRING,Campaign_Data_13:STRING,Campaign_Data_14:STRING,Campaign_Data_15:STRING,Campaign_Data_16:STRING,Campaign_Data_17:STRING,Campaign_Data_18:STRING,Campaign_Data_19:STRING,Campaign_Data_20:STRING,Campaign_Data_21:STRING,Campaign_Data_22:STRING,Campaign_Data_23:STRING,Campaign_Data_24:STRING,Campaign_Data_25:STRING,Campaign_Data_26:STRING,Campaign_Data_27:STRING,Campaign_Data_28:STRING,Campaign_Data_29:STRING,Campaign_Data_30:STRING,Campaign_Data_31:STRING,Campaign_Data_32:STRING,Campaign_Data_33:STRING,Campaign_Data_34:STRING,Campaign_Data_35:STRING,utm_source:STRING,utm_medium:STRING,utm_campaign:STRING,utm_content:STRING,utm_term:STRING,GCLID:STRING,ip:STRING,uagent:STRING,email:STRING,title:STRING,first_name:STRING,first_surname:STRING,second_surname:STRING,id_number:STRING,phone_number:STRING,last_source_string:STRING,tipo:STRING,date_of_birth:STRING,gender:STRING,address_1:STRING,address_2:STRING,address_3:STRING,city:STRING,region:STRING,postcode:STRING,email_type:STRING,company:STRING,phone_type:STRING,country:STRING,middle_name:STRING,last_name:STRING,language_pref:STRING,source:STRING,contact_codes:STRING,communication_codes:STRING,gp_interests:STRING,legacy_optin_details:STRING,legacy_optin_date:STRING,FIRMAS_2016:STRING,APERTURAS_2016X:STRING,mail_flow_a:STRING,NUMCLI:STRING,CLICS_2016X:STRING,mail_flow_b:STRING,piloto_imddp:STRING,phone_number2:STRING,antiguedad:STRING,reactivacion:STRING,high_donors:STRING,SFDC_Contact_ID:STRING,no_abierto_click_12_m:STRING,data_capture_equal_0_12m:STRING,legal_age:STRING,SFDC_Lead_ID:STRING,advocacy_equal_0_12m:STRING,email_to_target_equal_0_12m:STRING,news_20042018:STRING,DELETE_FAIL_2018:STRING,herencias_considerers:STRING,herencias_intenders:STRING,campamentos:STRING,string_field_107:STRING
```

On the options use:

* Field delimiter: comma
* Header rows to skip 1
* Number of errors allowed 100
* Allow quoted newlines: Y
* Allow jagged rows: Y
* Ignore unknown values: Y

Once the file is uploaded confirm that the number of entries is the same as the number of lines. You can count the lines of all CSVs in a folder with the command:

```bash
cd /path/to/csvs/folder/
wc -l *
```

And get the number of records in transactional with:

```sql
#standardSQL
SELECT COUNT(*) FROM spain.transactional;
```

## 4 - Clean

First delete the **CSV files** from Google Cloud Storage.

