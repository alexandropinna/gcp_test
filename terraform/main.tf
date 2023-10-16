# Include the 'networking' module from the './modules/networking' directory
module "networking" {
  
  # Path to the 'networking' module source code
  source = "./modules/networking"
  
  # Provide input variables for the 'networking' module
  vpc_name        = var.vpc_name
  vpc_description = var.vpc_description
  subnets         = var.subnets
  region          = var.region
  labels          = var.labels
}

# Include the 'gke_cluster' module from the './modules/gke_cluster' directory
module "gke_cluster" {
  
  # Path to the 'gke_cluster' module source code
  source = "./modules/gke_cluster"
  
  # Provide input variables for the 'gke_cluster' module
  cluster_name     = var.cluster_name
  cluster_location = var.cluster_location
  node_pool_name   = var.node_pool_name
  node_count       = var.node_count
  min_node_count   = var.min_node_count
  max_node_count   = var.max_node_count
  machine_type     = var.machine_type
  
  # Fetch outputs from the 'networking' module to be used as inputs for the 'gke_cluster' module
  vpc_name        = module.networking.vpc_name
  subnetwork_name = module.networking.subnet_names[0]
  
  labels          = var.labels
}
