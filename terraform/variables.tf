variable "credentials" {
  description = "Path to your google_credentials.json"
  default     = ".key/google_credentials.json"
}

variable "project" {
  description = "Your GCP Project ID"
  default     = "germany-air-quality"
}

variable "region" {
  description = "Your project region"
  default     = "us-central1"
}

variable "zone" {
  description = "Your project zone"
  default     = "us-central1-a"
}

variable "location" {
  description = "Your project location"
  default     = "US"
}

variable "gcs_bucket_name" {
  description = "The name of your bucket. This should be unique across GCP"
  default     = "germany-air-pollution-data"
}

variable "gcs_storage_class" {
  description = "Storage class type for your bucket"
  default     = "STANDARD"
}

variable "prod_bq_dataset" {
  description = "The name of your dbt production dataset"
  default     = "prod"
}

variable "stg_bq_dataset" {
  description = "The name of your staging dataset"
  default     = "air_pollution"
}

variable "vm_image" {
  description = "Image for you VM"
  default     = "ubuntu-os-cloud/ubuntu-2004-lts"
}

variable "network" {
  description = "Network for your instance"
  default     = "default"
}

