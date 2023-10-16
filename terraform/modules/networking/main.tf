# Define a resource of type 'google_compute_network' to create a VPC in GCP
resource "google_compute_network" "vpc" {
  
  # Name of the VPC, sourced from a variable
  name = var.vpc_name
  
  # Disable automatic creation of subnetworks in all regions
  auto_create_subnetworks = false
  
  # Description for the VPC, sourced from a variable
  description = var.vpc_description
}

# Define a resource of type 'google_compute_subnetwork' to create subnets in the VPC
resource "google_compute_subnetwork" "subnet" {
  
  # Create multiple subnetworks based on the length of the 'subnets' variable
  count = length(var.subnets)
  
  # Name of the subnetwork, with an index to ensure uniqueness
  name = "my-subnet-${count.index}"
  
  # IP CIDR range for the subnetwork, sourced from the 'subnets' variable
  ip_cidr_range = var.subnets[count.index]
  
  # Region where the subnetwork will be created, sourced from a variable
  region = var.region
  
  # Link to the VPC in which this subnetwork will be created
  network = google_compute_network.vpc.self_link
}
