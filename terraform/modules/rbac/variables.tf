variable "scope" {
  description = "Identificador del recurso de Azure donde se asignaran  los permisos"
  type        = string
}



variable "principal_id" {
  description = "Identificador de la identidad que tendra los permissos para acceder al scope"
  type        = string
}

