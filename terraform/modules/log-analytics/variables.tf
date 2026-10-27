variable "name" {
  description = "nombre del Log_analytics"
  type        = string

}



variable "location" {
  description = "region del recurso"
  type        = string
}


variable "retention_in_days" {
  description = "dias en que se retendran los datos"
  type        = number

}


variable "resource_group_name" {
  description = "nombre del grupo de recursos"
  type        = string

}

variable "tags" {
  description = "etiquetas"
  type        = map(string)
  default     = {}
}


