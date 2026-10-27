resource "azurerm_log_analytics_workspace" "this" {
  name                = var.name
  location            = var.location
  retention_in_days   = var.retention_in_days
  tags                = var.tags
  resource_group_name = var.resource_group_name
  #Le indicaremos el sku de pago por uso
  sku = "PerGB2018"

}