locals {
  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "portfolio"
  }
}

module "resource_group" {
  #Coje la informacion dentro de la siguiente dirrecion 
  source = "../../modules/resource-group"

  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location

  tags = local.common_tags
}

module "networking" {
  #Coje la informacion dentro de la siguiente dirrecion 
  source = "../../modules/networking"

  name                = "${var.project_name}-${var.environment}-vnet"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = ["10.10.0.0/16"]


  #Aqui indicaremos las subnets que deben crearse, con el for_each de main.tf de modules, creara una subnet por cada valor añadido
  subnets = {
    app = {
      address_prefixes = ["10.10.1.0/24"]
    }

    data = {
      address_prefixes = ["10.10.2.0/24"]
    }

    management = {
      address_prefixes = ["10.10.3.0/24"]
    }
  }

  tags = local.common_tags
}


