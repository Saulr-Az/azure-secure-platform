#Consulta la identidad con la que estamos autenticados en Azure
data "azurerm_client_config" "current" {}

#Consutlaremos el secreto que crearemos en el Key Vault
data "azurerm_key_vault_secret" "vm_admin_password" {
  name         = "vm1-admin-password"
  key_vault_id = module.key_vault.key_vault_id
}