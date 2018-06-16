# Getting started

## Access to data

First you'll need access to Engaging Networks or Engaging Networks Data.

## Access to Google Cloud

Make sure you have access to your [Google Cloud platform account](https://console.cloud.google.com/). You'll need access to Google Cloud Storage and Google Big Query.

## Create a dataset

This will be the dataset you use to process all the data. In this repository our dataset is named **spain**. All the tables mentioned in this repository will be here.

* [Big Query home](https://bigquery.cloud.google.com/)

## Create a Google Cloud Storage bucket

You can't upload or download large files in Big Query. You'll need a Google Cloud Storage Bucket to temporarly store the files. In this repository our bucket is named **gpes-bigquery-files**.

* [Cloud Storage home](https://console.cloud.google.com/storage/)

It's better to create a Bucket just for this and ensure the files aren't public.

## Cyberduck

You can use [Cyberduck](https://cyberduck.io/) to upload the files to Google Cloud Storage. You can upload and download files directly from your browser in [Google Cloud Storage](https://console.cloud.google.com/storage/), but Cyberduck is recommended.
