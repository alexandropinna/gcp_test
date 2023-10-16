module "networking" {
  source          = "./modules/networking"
  vpc_name        = var.vpc_name
  vpc_description = var.vpc_description
  subnets         = var.subnets
  region          = var.region

  labels                  = var.labels
}


module "gke_cluster" {
  source           = "./modules/gke_cluster"
  cluster_name     = var.cluster_name
  cluster_location = var.cluster_location
  node_pool_name   = var.node_pool_name
  node_count       = var.node_count
  min_node_count   = var.min_node_count
  max_node_count   = var.max_node_count
  machine_type     = var.machine_type
  vpc_name         = module.networking.vpc_name
  subnetwork_name  = module.networking.subnet_names[0]

  labels                  = var.labels
}

