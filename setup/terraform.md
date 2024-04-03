## Terraform Infrastructure Setup

- Clone the repository in your local machine.

```bash
git clone https://github.com/voduyquoc/air_pollution_tracking.git && \
cd air_pollution_tracking/terraform
```

- You will edit your `GCP Project ID`, `gcs_bucket_name` and `Path to your google_credentials.json` in the file `variables.tf`. Use the same values throughout the project. 

- Initiate terraform and download the required dependencies-

  ```bash
  terraform init
  ```

- View the Terraform plan

  ```bash
  terraform plan
  ```

- Terraform plan should show the creation of following services -

  - `e2-standard-4` Compute Instance for Kafka
  - A Google Cloud Storage bucket
  - Two Bigquery Datasets
    - air_pollution
    - prod

- Apply the infra. **Note** - Billing will start as soon as the apply is complete.

  ```bash
  terraform apply
  ```

- Once you are done with the project. Teardown the infra using-

  ```bash
  terraform destroy
  ```

**Note:** The infrastructure was setup a tad generously, you might not actually be fully utilizing the compute power. Feel free to reduce the instance sizes and test.



#### [Installation Reference - Ankur Chavda](https://github.com/ankurchavda/streamify/blob/main/setup/terraform.md)