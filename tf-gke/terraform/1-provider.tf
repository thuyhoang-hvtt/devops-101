# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "hello-devops-101"
  region  = "asia-southeast1"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "devops_tf_state-8055"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source = "hashicorp/google"
      version   = "~> 4.0"
    }
  }
}
