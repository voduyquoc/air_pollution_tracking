## GCP

### Initial Setup

Checkout this [video](https://www.youtube.com/watch?v=Hajwnmj0xfQ&list=PL3MmuxUbc_hJed7dXYoJw8DoCuVHhGEQb&index=11&t=3s)

1. Create an account with your Google email ID 
2. Setup your first [project](https://console.cloud.google.com/) if you haven't already
    * eg. "germany-air-quality", and note down the "Project ID" (we'll use this later when deploying infra with Terraform)
3. Setup [service account & authentication](https://cloud.google.com/docs/authentication/getting-started) for this project
    * Grant `Viewer` role to begin with.
    * Download service-account-keys (`.json`) for auth. (Please do not share this key file publicly. Keep it secure!)
    * Rename the `.json` key file to `google_credentials.json`
   
### Setup for Access

1. [IAM Roles](https://cloud.google.com/storage/docs/access-control/iam-roles) for Service account:
   * Go to the *IAM* section of *IAM & Admin* https://console.cloud.google.com/iam-admin/iam
   * Click the *Edit principal* icon for your service account.
   * Add these roles in addition to *Viewer* : **Storage Admin** + **BigQuery Admin** + **Compute Admin**
   
2. Enable these APIs for your project:
   * bigquery
   * storage
   * compute engine
   
   ***Note:** If there is an error message, that a billing account is missing for this new project, follow these additional steps:*
   * Go to the [Google Cloud Platform billing config](https://console.cloud.google.com/billing/projects).
   * Click on the three dots next to the new project and select "Change billing". 
   * Choose the billing account and confirm by clicking "Set account".
   * Execute the shell command above again to enable the APIs.



#### [Installation Reference - DataTalks Club](https://github.com/DataTalksClub/data-engineering-zoomcamp/blob/main/01-docker-terraform/1_terraform_gcp/2_gcp_overview.md)