#Con locals estamos creando la lista de etiquetas que se asignaran cuando se cree un recurso.
locals {
  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "portfolio"
  }
  security_tags = {
    security = var.security
  }
}

#Entorno de security

#MODULO GRUPO DE RECURSOS DE SEGURIDAD
module "security_resource_group" {
  #Coje la informacion dentro de la siguiente dirrecion 
  source = "../../modules/resource-group"

  name     = "${var.project_name}-${var.security}-rg"
  location = var.location
  tags     = merge(local.common_tags, local.security_tags)
}

#Modulo del Azure Key Vault
module "key_vault" {
  source = "../../modules/key-vault"

  name                = "azp-${var.security}-keyv"
  location            = var.location
  resource_group_name = module.security_resource_group.name
  tags                = local.common_tags
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

#Asignacion de permisos al vault para poder crear los secretos
module "rbac_keyvault_technician" {
  source = "../../modules/rbac"

  scope                = module.key_vault.key_vault_id
  principal_id         = data.azurerm_client_config.current.object_id
  role_definition_name = "Key Vault Secrets User"
}

#Asignacion de permisos  para github
module "rbac_keyvault_technician" {
  source = "../../modules/rbac"

  scope                = module.key_vault.key_vault_id
  principal_id         = "dcc7412d-f6e7-4fc4-9bbc-a8b858bce36d"
  role_definition_name = "Key Vault Secrets User"
}