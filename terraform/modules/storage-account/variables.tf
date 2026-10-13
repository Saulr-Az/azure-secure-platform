variable "name" {
  description = "Nombre de la cuenta de almacenamiento"
  type        = string

}



variable "resource_group_name" {
  description = "A que grupo de RG pertenecera"
  type        = string

}


variable "location" {
  description = "Region de la cuenta de almacenamiento "
  type        = string

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

variable "min_tls_version" {
  description = "Versión mínima de TLS permitida"
  type        = string

}

variable "tags" {
  description = "Etiquetas del recurso"
  type        = map(string)

}



















