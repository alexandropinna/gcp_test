variable "labels" {
  description = "Labels (tags) to be applied to GCP resources"
  type        = map(string)
}

variable "atlas_public_key" {
  description = "La clave pública para autenticación en MongoDB Atlas."
  type        = string
  sensitive   = true
}

variable "atlas_private_key" {
  description = "La clave privada para autenticación en MongoDB Atlas."
  type        = string
  sensitive   = true
}

variable "atlas_org_id" {
  description = "El ID de la organización en MongoDB Atlas."
  type        = string
}

variable "vpc_name" {
  description = "El nombre de la VPC"
  type        = string
}

variable "vpc_description" {
  description = "Descripción de la VPC"
  type        = string
}

variable "region" {
  type        = string
}

variable "subnets" {
  type = list(string)
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
