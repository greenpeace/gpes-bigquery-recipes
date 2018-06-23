# Getting started

## Access

### To data

You'll need access to **Engaging Networks** or Engaging Networks Data as CSVs. If you intend to use **Salesforce** data you'll also need access.

Because BigQuery is great at processing large volumes of data it's a good idea to upload raw data like for example:

* Transactional petition signups for all your petitions
* Transactional email opens and clicks (one email per interaction)
* Transactional phone calls records and results
* Transactional information about one-off and regular donations

By uploading raw data you have more flexibility to analyse. And to update your database you just need to add the latest data to the existing datasets.

And you can also upload user data. This will be useful to cross with transactional data.

### To Google Cloud

Make sure you have access to the [Google Cloud Platform](https://console.cloud.google.com/). At least you'll need access to [Google Cloud Storage](https://console.cloud.google.com/storage/) and [Google BigQuery](https://bigquery.cloud.google.com/). Your office might have a Google Cloud project, for example for Planet 4.

Google BigQuery is [very cheap](https://cloud.google.com/bigquery/pricing). It's free up to 1 Terabyte of data processing per month and it's about 5 USD for each extra Terabyte.

## Create a Google Cloud BigQuery dataset

This will be the dataset you use to process all the data. In this repository our dataset is named **spain**. All the tables mentioned in this repository will be here.

* [BigQuery home](https://bigquery.cloud.google.com/)

## Create a Google Cloud Storage bucket

You can't upload or download large files in BigQuery. You'll need a Google Cloud Storage Bucket to temporarly store the files. In this repository our bucket is named **gpes-bigquery-files**.

* [Cloud Storage home](https://console.cloud.google.com/storage/)

It's better to create a Bucket just for this and ensure the files aren't public.

## File upload to Cloud Storage with Cyberduck

You can use [Cyberduck](https://cyberduck.io/) to upload the files to Google Cloud Storage. You can upload and download files directly from your browser in [Google Cloud Storage](https://console.cloud.google.com/storage/), but Cyberduck is recommended, specially with larger files.

See also [how to connect to Google Storage with Cyberduck](https://trac.cyberduck.io/wiki/help/en/howto/googlestorage).
