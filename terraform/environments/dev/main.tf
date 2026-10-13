#Con locals estamos creando la lista de etiquetas que se asignaran cuando se cree un recurso.Por ahora esta solo la lista common_tags,a medida que vayamos puliendo el projecto añadiremos mas listas. 
locals {
  common_tags = {
    project     = var.project_name
    environment = var.environment
    managed_by  = "terraform"
    purpose     = "portfolio"
  }
}
#MODULO GRUPO DE RECURSOS
module "resource_group" {
  #Coje la informacion dentro de la siguiente dirrecion 
  source = "../../modules/resource-group"

  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location

  tags = local.common_tags
}

#MODULO NETWORKING VNET Y SUBNETS
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

  # Le indicamos el id del nsg que se le asignara
  network_security_group_id = module.network_security_group.network_security_group_id
}

#MODULO NSG
module "network_security_group" {
  source = "../../modules/network-security-group/"

  name                = "${var.project_name}-${var.environment}-nsg"
  location            = var.location
  resource_group_name = module.resource_group.name
  priority            = var.priority
  tags                = local.common_tags


}

#MODULO NIC
module "network_interface" {
  source = "../../modules/network-interface"

  name                = "${var.project_name}-${var.environment}-nic"
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = local.common_tags
  #En caso que queramos poner la ip estatica cambiar el valor de private_ip_address_allocation y descomentar la linea private_ip_address
  private_ip_address_allocation = "Dynamic"
  #private_ip_address = "10.10.1.6"

  subnet_id = module.networking.subnet_id["app"]



}

#Modulo vm
module "virtual_machine" {
  source = "../../modules/virtual-machine"

  name                  = "${var.project_name}-vm"
  location              = var.location
  resource_group_name   = module.resource_group.name
  tags                  = local.common_tags
  size                  = "Standard_B1s"
  admin_username        = "AzureSr"
  admin_password        = var.admin_password
  network_interface_ids = module.network_interface.network_interface_ids


}

#Modulo Cuenta de almacenamiento

module "storage_account" {
  source = "../../modules/storage-account"

  name                     = "st01"
  location                 = var.location
  resource_group_name      = module.resource_group.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = "TLS1_2"
  tags                     = local.common_tags


}