terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.18.0"
    }
  }
}

provider "google" {
  project     = "miscel-415720"
  region      = "us-central1"
  credentials = file(var.credentials)
}