terraform {
  required_version = ">= 1.8.0"
  backend "azurerm" {}
  #Aqui le indicamos que proveedor necesita para poder crear el recurso, le indicaremos la version mas nueva
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    time = {
      source = "hashicorp/time"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}

provider "azurerm" {
  features {}
}
