variable "name" {
  description = "nombre del NSG"
  type        = string

}

variable "location" {
  description = "Region donde el NSG"
  type        = string
}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
}

variable "priority" {
  description = "Prioridad de la regla de seguridad"
  type        = string
}

variable "tags" {
  description = "Las etiquetas del recurso"
  type        = map(string)
}

