import pandas as pd
from google.cloud import storage, bigquery
from google.oauth2.service_account import Credentials
from pathlib import Path


def transform_and_upload(csv_filepath: str, bucket_name: str, parquet_filename: str, service_account_path: str):
  # Authenticate with Google using the service account file
  credentials = Credentials.from_service_account_file(service_account_path)
  raw_data_path = Path(__file__).parents[1] / "raw_data" / "parquet_data" 

  # Read the CSV file into a Pandas DataFrame
  raw = pd.read_csv(csv_filepath)
  raw = raw.rename(columns = {col : col.replace(".","_") for col in raw.columns})
  # Save the DataFrame as a Parquet file
  parquet_filepath = parquet_filename + '.parquet'
  full_file_path = f"{raw_data_path}/{parquet_filepath}"
  
  raw.to_parquet(full_file_path)

  # Upload the Parquet file to Google Cloud Storage
  storage_client = storage.Client(credentials=credentials)
  bigquery_client = bigquery.Client(credentials=credentials)
  bucket = storage_client.bucket(bucket_name)
  blob = bucket.blob(parquet_filename)
  blob.upload_from_filename(full_file_path)

  # Load raw data from Challenge Bucket to BigQuery
  blob_uri = "gs://" + bucket_name + "/" + parquet_filename
  print(blob_uri)
  job_config = bigquery.LoadJobConfig(source_format=bigquery.SourceFormat.PARQUET)
  table_id = "dbtlab-371120.raw_belvo_challenge."+parquet_filename
  bq_job = bigquery_client.load_table_from_uri(blob_uri, table_id, job_config = job_config)
  bq_job.result()
  destination_table = bigquery_client.get_table(table_id)
  print("Loaded {} rows.".format(destination_table.num_rows))
  

  



  

