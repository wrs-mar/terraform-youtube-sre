terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.51.0"
    }

  }
}

provider "google" {
  credentials = var.gcp_auth_file
  project     = var.project_id
  region      = var.region
  zone        = var.main_zone

}


