#Creamos los bloques para las variables

variable "name" {
  description = "nombre de la vnet"
  type        = string
}
variable "location" {
  description = "region del recurso"
  type        = string
}
variable "resource_group_name" {
  description = "el grupo de recursos"
  type        = string
}
variable "address_space" {
  description = "la dirrecion ip"
  type        = list(string)
}
variable "tags" {
  description = "las etiquetas que se asginaran"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "Aqui definiremos las subredes que se crearan en la vnet"

  type = map(object({

    address_prefixes = list(string)

  }))



}