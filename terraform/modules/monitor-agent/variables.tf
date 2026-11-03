variable "name" {
  description = "Nombre del recurso"
  type        = string

}

variable "virtual_machine_id" {
  description = "Identificador de la vm"
  type        = string

}


variable "publisher" {
  description = "Nombre del proveedor"
  type        = string
  default     = "Microsoft.Azure.Monitor"
}

variable "type" {
  description = "Tipo de proveedor"
  type        = string

}

variable "type_handler_version" {
  description = "Version del proveedor"
  type        = string

}
