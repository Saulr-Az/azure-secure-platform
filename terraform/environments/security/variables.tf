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

variable "security" {
  description = "Deployment environment"
  type        = string
  default     = "security"
}


variable "project_name" {
  description = "Project name"
  type        = string
  default     = "azportfolio"
}
