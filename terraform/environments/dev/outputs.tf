#Con este output sacaremos el identificador de la cuenta de almacenamiento para referenciarlo en un futuro
output "storage_account_id" {

  description = "identificador de la cuenta de almacenamiento"
  value       = module.storage_account.storage_account_id
}

#Con este el nombre del la cuenta

output "storage_account_name" {
  description = "Nombre de la cuenta de almacenamiento"
  value       = module.storage_account.storage_account_name

}