variable "name" {
  description = "nombre del nic"
  type        = string


}


variable "location" {
  description = "region del nic"
  type        = string

}



variable "tags" {
  description = "etiquetas del nic"
  type        = map(string)

}

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
}


variable "private_ip_address_allocation" {
  description = "Indicar el tipo de Ip estatica o dinamica"
  type        = string
}

#Descomentar esta variable solo si se indica Static en la private_ip_address_allocation
#variable "private_ip_address" {
#    description="Dirrecion ip private_ip_address"
#    type= string
#}



variable "subnet_id" {
  description = "Identificador de la subnet"
  type        = string
}

