#Outputs para sacar nombre y el id del Azure Key Vault
output "key_vault_id" {
  description = "Identificador del Azure Key Vault"
  value       = azurerm_key_vault.this.id
}

output "azurerm_key_vault_name" {
  description = "Nombre del Azure Key Vault"
  value       = azurerm_key_vault.this.name
}