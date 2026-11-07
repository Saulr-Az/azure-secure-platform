#Sacamos el nombre de la cuenta de almacenamiento

output "storage_account_name" {
  description = "Nombre de la cuenta de almacenamiento"
  value       = azurerm_storage_account.state.name

}

#Sacamos el nombre del contenedor
output "storage_container_name" {
  description = "Nombre del contenedor"
  value       = azurerm_storage_container.state.name

}
