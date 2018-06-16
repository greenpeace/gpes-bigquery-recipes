# Getting started

## Access to data

First you'll need access to Engaging Networks or Engaging Networks Data as CSVs.

## Access to Google Cloud

Make sure you have access to the [Google Cloud Platform](https://console.cloud.google.com/). At least you'll need access to [Google Cloud Storage](https://console.cloud.google.com/storage/) and [Google Big Query](https://bigquery.cloud.google.com/). Your office might have a Google Cloud project, for example for Planet 4.

Google Big Query is [very cheap](https://cloud.google.com/bigquery/pricing). It's free up to 1 Terabyte of data processing per month and it's about 5 USD for each extra Terabyte.

## Create a Big Query dataset

This will be the dataset you use to process all the data. In this repository our dataset is named **spain**. All the tables mentioned in this repository will be here.

* [Big Query home](https://bigquery.cloud.google.com/)

## Create a Google Cloud Storage bucket

You can't upload or download large files in Big Query. You'll need a Google Cloud Storage Bucket to temporarly store the files. In this repository our bucket is named **gpes-bigquery-files**.

* [Cloud Storage home](https://console.cloud.google.com/storage/)

It's better to create a Bucket just for this and ensure the files aren't public.

## File upload to Cloud Storage with Cyberduck

You can use [Cyberduck](https://cyberduck.io/) to upload the files to Google Cloud Storage. You can upload and download files directly from your browser in [Google Cloud Storage](https://console.cloud.google.com/storage/), but Cyberduck is recommended, specially with larger files.
