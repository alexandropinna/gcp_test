variable "labels" {
  description = "Labels (tags) to be applied to GCP resources"
  type        = map(string)
}

variable "cluster_name" {
  description = "Nombre del cluster GKE"
  type        = string
}

variable "cluster_location" {
  description = "Ubicación del cluster GKE"
  type        = string
}

variable "node_pool_name" {
  description = "Nombre del node pool"
  type        = string
}

variable "node_count" {
  description = "Número de nodos en el node pool"
  type        = number
}

variable "min_node_count" {
  description = "Número mínimo de nodos para autoscaling"
  type        = number
}

variable "max_node_count" {
  description = "Número máximo de nodos para autoscaling"
  type        = number
}

variable "machine_type" {
  description = "Tipo de máquina para los nodos"
  type        = string
}

variable "vpc_name" {
  description = "Nombre de la VPC"
  type        = string
}

variable "subnetwork_name" {
  description = "Nombre de la subred"
  type        = string
}
