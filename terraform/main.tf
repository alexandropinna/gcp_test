resource "google_compute_network" "vpc" {
  name                    = "mi-vpc"
  auto_create_subnetworks = false
  description             = "Mi VPC personalizada"
}

resource "google_compute_subnetwork" "subnet_1" {
  name          = "mi-subnet-1"
  ip_cidr_range = "10.0.1.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc.self_link
}

resource "google_compute_subnetwork" "subnet_2" {
  name          = "mi-subnet-2"
  ip_cidr_range = "10.0.2.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc.self_link
}

resource "google_container_cluster" "primary" {
  name     = "mi-cluster"
  location = "us-central1-a"
  deletion_protection = false

  node_pool {
    name       = "default-pool"
    node_count = 3 

    autoscaling {
      min_node_count = 3 
      max_node_count = 6 
    }

    node_config {
      machine_type = "n1-standard-1"
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
  }

  network    = google_compute_network.vpc.name
  subnetwork = google_compute_subnetwork.subnet_1.name
}
