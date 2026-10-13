#Indicamos variables que utilizaremos en el main.tf de environments.Usaremos default para que coja valores por defecto


variable "location" {
  description = "Azure region"
  type        = string
  default     = "spaincentral"
}


variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}


variable "project_name" {
  description = "Project name"
  type        = string
  default     = "azportfolio"
}


variable "priority" {
  description = "Prioridad de la regla"
  type        = number
  default     = 100

}

variable "admin_password" {
  description = "Contraseña del admin"
  type        = string
  sensitive   = true
}

variable "account_tier" {
  description = "Tier de la cuenta "
  type        = string
  default     = "Standard"

}

variable "account_replication_type" {
  description = "Tipo de replicacion"
  type        = string
  default     = "LRS"
}