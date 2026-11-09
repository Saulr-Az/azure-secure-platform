resource "azurerm_key_vault" "this" {
  name                       = var.name
  location                   = var.location
  tenant_id                  = var.tenant_id
  resource_group_name        = var.resource_group_name
  sku_name                   = "standard"
  rbac_authorization_enabled = true
  soft_delete_retention_days = 7
  purge_protection_enabled   = true
  tags                       = var.tags

}