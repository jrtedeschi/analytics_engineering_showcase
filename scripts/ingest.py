from challenge_utils import transform_and_upload
import os
from pathlib import Path
import glob


raw_data_path = Path(__file__).parents[1] / "raw_data" 
csv_files = glob.glob(f"{raw_data_path}/csv_data/*.csv")

service_account_path =  "/home/jrtedeschi/.google/credentials/credentials.json"

for csv_path in csv_files:
    abs_file_name, file_ext = os.path.splitext(csv_path)
    file_name = abs_file_name.split("/")[-1]
    transform_and_upload(csv_filepath=csv_path, bucket_name="belvo_challenge_dbtlab-371120", service_account_path=service_account_path, parquet_filename=file_name)


