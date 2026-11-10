#Con este output sacaremos el identificador del Key vault
output "key_vault_id" {

  description = "identificador de la cuenta de almacenamiento"
  value       = module.key_vault.key_vault_id
}