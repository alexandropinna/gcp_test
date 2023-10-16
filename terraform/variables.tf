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
