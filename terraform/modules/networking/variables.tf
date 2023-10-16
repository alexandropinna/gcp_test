variable "labels" {
  description = "Labels (tags) to be applied to GCP resources"
  type        = map(string)
}

variable "vpc_name" {
  description = "El nombre de la VPC"
  type        = string
}

variable "vpc_description" {
  description = "Descripción de la VPC"
  type        = string
}

variable "subnets" {
  description = "Lista de CIDRs para las subredes"
  type        = list(string)
}

variable "region" {
  description = "Región donde se crearán los recursos"
  type        = string
  default     = "us-central1" 
}
