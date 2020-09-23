  
provider "google" {
  project = var.project_id
  region  = var.region
  version = "3.11"
}

provider "google-beta" {
  project = var.project_id
  region  = var.region
  version = "3.11"
}

terraform {
  required_version = ">= 0.13"

  backend "gcs" {
    bucket = "mgcp-testing-tf-state"
    prefix = "vpc"
  }
}