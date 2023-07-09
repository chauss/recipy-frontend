terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.29.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = "europe-west3"
}
