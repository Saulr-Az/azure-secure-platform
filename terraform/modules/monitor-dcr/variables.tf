variable "name" {
  description = "nombre del DRC"
  type        = string

}

variable "location" {
  description = "region"
  type        = string

}

variable "resource_group_name" {
  description = "nombre del grupo de recursos que pertenecera"
  type        = string

}

variable "log_analytics_workspace_id" {
  description = "ID del Log Analytics Workspace"
  type        = string
}


variable "tags" {
  description = "etiquetas"
  type        = map(string)

}