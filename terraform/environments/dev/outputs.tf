#Esto son los datos que nos muestra en caso que se cree el recurso
output "resource_group_name" {
  description = "Nombre de nuestro grupo de Recursos"
  value       = module.resource_group.name
}

output "resource_group_id" {
  description = "ID de nuestro Grupo de recursos"
  value       = module.resource_group.id
}


