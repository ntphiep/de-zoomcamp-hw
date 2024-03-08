terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.18.0"
    }
  }
}

provider "google" {
  project     = var.project
  region      = var.region
  credentials = var.credentials
}





# resource "google_storage_bucket" "auto-expire" {
#   name          = "miscel-415720-bk-1"

#   location      = var.location
#   force_destroy = true

#   lifecycle_rule {
#     condition {
#       age = 1
#     }
#     action {
#       type = "AbortIncompleteMultipartUpload"
#     }
#   }

#   lifecycle_rule {
#     condition {
#       age = 1
#     }
#     action {
#       type = "AbortIncompleteMultipartUpload"
#     }
#   }
# }


resource "google_bigquery_dataset" "demo_dataset" {
  dataset_id = "clm_demo_dataset"
  location   = var.location
}

resource "google_bigquery_table" "demo_table" {
  dataset_id = google_bigquery_dataset.demo_dataset.dataset_id
  project    = var.project
  table_id   = "clm_demo_table"

  schema = <<EOF
  [
    {
      "name": "name",
      "type": "STRING",
      "mode": "REQUIRED"
    },
    {
      "name": "age",
      "type": "INTEGER"
    },
    {
      "name": "email",
      "type": "STRING"
    }
  ]
  EOF
}