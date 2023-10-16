resource "google_compute_network" "vpc" {
  name                    = var.vpc_name
  auto_create_subnetworks = false
  description             = var.vpc_description
}

resource "google_compute_subnetwork" "subnet" {
  count          = length(var.subnets)
  name           = "my-subnet-${count.index}"
  ip_cidr_range  = var.subnets[count.index]
  region         = var.region
  network        = google_compute_network.vpc.self_link
}
