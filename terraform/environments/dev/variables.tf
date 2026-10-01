#Este variables mira el variables del modulo y aplica los valores
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
  default     = "100"

}