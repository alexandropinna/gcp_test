# Define a resource of type 'google_container_cluster' for creating a GKE cluster
resource "google_container_cluster" "primary" {
  
  # Name of the GKE cluster
  name = var.cluster_name
  
  # Location (zone/region) of the GKE cluster
  location = var.cluster_location
  
  # If set to true, the GKE cluster cannot be deleted from the console
  deletion_protection = false

  # Define the node pool for the GKE cluster
  node_pool {
    
    # Name of the node pool
    name = var.node_pool_name
    
    # Number of nodes in the node pool
    node_count = var.node_count

    # Autoscaling configuration for the node pool
    autoscaling {
      
      # Minimum number of nodes for autoscaling
      min_node_count = var.min_node_count
      
      # Maximum number of nodes for autoscaling
      max_node_count = var.max_node_count
    }

    # Configuration for the nodes in the node pool
    node_config {
      
      # Machine type for the nodes
      machine_type = var.machine_type
      
      # OAuth scopes for the nodes. This example gives nodes full access to all Cloud APIs
      oauth_scopes = [
        "https://www.googleapis.com/auth/cloud-platform"
      ]
    }
  }

  # VPC in which the GKE cluster is deployed
  network = var.vpc_name
  
  # Subnetwork in which the GKE cluster is deployed
  subnetwork = var.subnetwork_name
}
