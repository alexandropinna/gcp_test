# A map variable to define the labels (tags) that will be applied to GCP resources
variable "labels" {
  description = "Labels (tags) to be applied to GCP resources"
  type        = map(string)
}

# A variable for the name of the GKE cluster
variable "cluster_name" {
  description = "Name of the GKE cluster"
  type        = string
}

# A variable for the location (zone/region) of the GKE cluster
variable "cluster_location" {
  description = "Location of the GKE cluster"
  type        = string
}

# A variable for the name of the node pool in the GKE cluster
variable "node_pool_name" {
  description = "Name of the node pool"
  type        = string
}

# A variable to specify the number of nodes in the GKE node pool
variable "node_count" {
  description = "Number of nodes in the node pool"
  type        = number
}

# A variable for the minimum number of nodes in autoscaling for the GKE node pool
variable "min_node_count" {
  description = "Minimum number of nodes for autoscaling"
  type        = number
}

# A variable for the maximum number of nodes in autoscaling for the GKE node pool
variable "max_node_count" {
  description = "Maximum number of nodes for autoscaling"
  type        = number
}

# A variable for the machine type of the nodes in the GKE node pool
variable "machine_type" {
  description = "Machine type for the nodes"
  type        = string
}

# A variable for the name of the VPC where the GKE cluster will be deployed
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

# A variable for the name of the subnetwork where the GKE cluster will be deployed
variable "subnetwork_name" {
  description = "Name of the subnetwork"
  type        = string
}
