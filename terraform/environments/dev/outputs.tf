#Esto son los datos que nos muestra en caso que se cree el recurso
output "resource_group_name" {
  description = "Name of the application resource group"
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID of the application resource group"
  value       = module.resource_group.id
}

