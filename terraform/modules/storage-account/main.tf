resource "azurerm_storage_account" "this" {
  name                            = var.name
  resource_group_name             = var.resource_group_name
  location                        = var.location
  account_tier                    = var.account_tier
  account_replication_type        = var.account_replication_type
  min_tls_version                 = var.min_tls_version
  allow_nested_items_to_be_public = false
  https_traffic_only_enabled      = true

#Para mejorar la seguridad del equipo vamos añadir retenciones de blob y del contendedor en caso que se borren por accidente un archivo o contendedor

    blob_properties {
    delete_retention_policy {
      days = 7
    }

    container_delete_retention_policy {
      days = 7
    }
  }
  tags                            = var.tags

}

