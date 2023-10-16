terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "5.1.0"
    }
    mongodbatlas = {
      source  = "mongodb/mongodbatlas"
      version = "1.12.1"
    }
  }
}

provider "google" {
  project = "cloud-402021"
  region  = "us-central1"
}


provider "mongodbatlas" {
  public_key  = var.atlas_public_key
  private_key = var.atlas_private_key
}