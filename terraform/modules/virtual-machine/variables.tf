variable "name" {
  description = "Nombre de la vm"
  type        = string

}

variable "location" {
  description = "Region de la vm"
  type        = string


}

variable "resource_group_name" {
  description = "El nombre del RG al que pertenecera"
  type        = string


}

variable "tags" {
  description = "etiquetas que se le asignara a la vm"
  type        = map(string)
  default     = {}

}

variable "size" {
  description = "tamaño del disco"
  type        = string

}

variable "admin_username" {
  description = "nombre del usuario admin de la vm"
  type        = string
  default     = "adminSr"

}
variable "admin_password" {
  description = "Contraseña del admin"
  type        = string
  sensitive   = true
}

variable "network_interface_ids" {
  description = "Aqui indicaremos el nic"
  type        = string
}






