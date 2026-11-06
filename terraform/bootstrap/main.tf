#Aqui añadiremos los proveedores

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}
}


#Creamos la variable random para crear el nombre la cuenta de almacenamiento
resource "random_string" "storage_suffix" {
  length  = 4
  upper   = false
  special = false
}


#Aqui indicaremos las etiquetas
locals {
  common_tags = {
    environment = "state_terraform"
    managed_by  = "terraform"
    purpose     = "portfolio"
  }
}


#Modulo del RG
resource "azurerm_resource_group" "state" {
  name     = "StorageStateSR"
  location = "spaincentral"
  tags     = local.common_tags

}

#Modulo storage account
resource "azurerm_storage_account" "state" {
  name                            = "azportfoliost${random_string.storage_suffix.result}"
  location                        = "spaincentral"
  resource_group_name             = azurerm_resource_group.state.name
  account_replication_type        = "LRS"
  account_tier                    = "Standard"
  allow_nested_items_to_be_public = false
  min_tls_version                 = "TLS1_2"
  tags                            = local.common_tags

}

#Modulo contenedor 

resource "azurerm_storage_container" "state" {

  name                  = "statetf"
  storage_account_id    = azurerm_storage_account.state.id
  container_access_type = "private"



}