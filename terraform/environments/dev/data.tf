#Consulta la identidad con la que estamos autenticados en Azure
data "azurerm_client_config" "current" {}

#Consutlaremos el secreto que crearemos en el Key Vault
data "azurerm_key_vault_secret" "vm_admin_password" {
  name         = "vm1-admin-password"
  key_vault_id = data.terraform_remote_state.security.outputs.key_vault_id
}

# Consulta los outputs creaods en el entorno de security
data "terraform_remote_state" "security" {
  backend = "azurerm"

  config = {
    resource_group_name  = "StorageStateSR"
    storage_account_name = "azportfoliost0cmn"
    container_name       = "statetf"
    key                  = "security.terraform.tfstate"

    use_azuread_auth = true
  }
}
