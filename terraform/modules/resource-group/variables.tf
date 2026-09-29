variable "name" {
  description = "El nombre del RG"
  type        = string
}

variable "location" {
  description = "La region"
  type        = string
}

variable "tags" {
  description = "Las etiquetas"
  type        = map(string)
  default     = {}
}