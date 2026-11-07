variable "name" {
  description = "Nombre del almacen de claves"
  type        = string

}

variable "location" {
  description = "Region del recurso"
  type        = string

}

variable "resource_group_name" {
  description = "Nombre del RG"
  type        = string

}

variable "tags" {
  description = "Etiquetas de los recursos"
  type        = map(string)

}