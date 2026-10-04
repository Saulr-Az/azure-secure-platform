#Creamos las variables para la vnet y las subredes


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

#Variable para crear subredes por cada valor añadido a la lista en environments/dev/main.tf
variable "subnets" {
  description = "Aqui definiremos las subredes que se crearan en la vnet"

  type = map(object({

    address_prefixes = list(string)

  }))

}

#variable para el identificador del ID lo usaremos para sacar el identificador de nsg
variable "network_security_group_id" {
  description = "ID del Network Security Group"
  type        = string
}
