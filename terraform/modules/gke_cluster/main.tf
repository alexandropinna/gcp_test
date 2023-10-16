resource "google_container_cluster" "primary" {
  name               = var.cluster_name
  location           = var.cluster_location
  deletion_protection = false

  node_pool {
    name       = var.node_pool_name
    node_count = var.node_count

    autoscaling {
      min_node_count = var.min_node_count
      max_node_count = var.max_node_count
    }

    node_config {
      machine_type = var.machine_type
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
  }

  network    = var.vpc_name
  subnetwork = var.subnetwork_name
}
