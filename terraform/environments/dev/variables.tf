#Indicamos variables que utilizaremos en el main.tf de environments.Usaremos default para que coja valores por defecto

#Variable para indicar la region de los recursos
variable "location" {
  description = "Azure region"
  type        = string
  default     = "spaincentral"
}

#Variable para indicar que se ha aplicado en el entorno de desarollo
variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

#Variable para indicar el nombre del portfolio
variable "project_name" {
  description = "Project name"
  type        = string
  default     = "azportfolio"
}

#Variable para indicar la prioridad de la regla
variable "priority" {
  description = "Prioridad de la regla"
  type        = number
  default     = "100"

}
