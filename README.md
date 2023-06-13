# Analytics Engineering Project

Welcome to the Analytics Engineering Showcase Project. This project utilizes Google Cloud's BigQuery for data storage and querying, Terraform for infrastructure management, and dbt (Data Build Tool) for transforming data in our warehouse.

This project is organized into four main directories:

- `dbt/`: Contains all the dbt models that transform our raw data into meaningful analytics tables. It's organized by models, tests, and macros.

- `raw_data/`: Contains the raw data that is loaded into BigQuery. 

- `scripts/`: Contains all the scripts used in this project, such as those for data extraction and loading.

- `terraform/`: Contains the Terraform scripts that define and provide data for resources required to run this project.

## Project Setup

1. **BigQuery Setup**: First, we need to setup our BigQuery dataset. Ensure you have the necessary permissions and your GCP project is setup correctly.

2. **Terraform Setup**: Terraform is used to manage our infrastructure. Make sure you have Terraform installed and properly configured with your GCP account. Navigate to the `terraform/` directory, then run `terraform init` to initialize your Terraform workspace. Then run `terraform apply` to create the resources defined in our Terraform scripts.

3. **Loading Raw Data**: Navigate to the `scripts/` directory. Here, you will find scripts for loading our raw data into BigQuery. Make sure your GCP account is configured and then run the script.

4. **DBT Setup**: You'll need dbt installed and configured to run the transformations. In the `dbt/` directory, run `dbt deps` to fetch the dependencies for our project, then `dbt run` to execute the transformations.

## Usage

After setting up the project as described above, you can run the entire ETL pipeline by navigating to the `scripts/` directory and running the main script.

## License

Distributed under the MIT License. See `LICENSE` for more information.

## Contact

João Rafael Tedeschi - joaorafaelbt@gmail.com

Project Link: [https://github.com/jrtedeschi/AnalyticsEngineeringShowcase](https://github.com/jrtedeschi/AnalyticsEngineeringShowcase)

Feel free to reach out if you have any questions or need further clarification. Enjoy exploring the project!

