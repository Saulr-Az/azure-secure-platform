#Con locals estamos creando la lista de etiquetas que se asignaran cuando se cree un recurso.Por ahora esta solo la lista common_tags,a medida que vayamos puliendo el projecto añadiremos mas listas. 
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

#Modulo aleatorio para dar un valor al azar y aplicarlo al nombre del storage_account
resource "random_string" "storage_suffix" {
  length  = 5
  upper   = false
  lower   = true
  numeric = true
  special = false
}


#MODULO GRUPO DE RECURSOS DE Desarrollo
module "resource_group" {
  #Coje la informacion dentro de la siguiente dirrecion 
  source = "../../modules/resource-group"

  name     = "${var.project_name}-${var.environment}-rg"
  location = var.location
  tags     = local.common_tags
}

#MODULO GRUPO DE RECURSOS DE SEGURIDAD
module "security_resource_group" {
  #Coje la informacion dentro de la siguiente dirrecion 
  source = "../../modules/resource-group"

  name     = "${var.project_name}-${var.security}-rg"
  location = var.location
  tags     = merge(local.common_tags, local.security_tags)
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
  size                  = "Standard_D2s_v3"
  admin_username        = "AzureSr"
  admin_password        = var.admin_password
  network_interface_ids = module.network_interface.network_interface_ids


}

#Modulo Cuenta de almacenamiento

module "storage_account" {
  source = "../../modules/storage-account"

  name                     = "azportfoliost${random_string.storage_suffix.result}"
  location                 = var.location
  resource_group_name      = module.resource_group.name
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type
  min_tls_version          = "TLS1_2"
  tags                     = local.common_tags


}

#Modulo Contenedor de almacenamiento

module "storage_container" {
  source = "../../modules/storage-container"

  name               = "container01"
  storage_account_id = module.storage_account.storage_account_id


}

#Modulo de asignacion de la identidad

module "rbac" {
  source       = "../../modules/rbac"
  scope        = module.storage_container.storage_container_id
  principal_id = module.virtual_machine.identity_id_vm
}

#Modulo de Log Analytics Workspace

module "log_analytics" {
  source = "../../modules/log-analytics"

  name                = "${var.project_name}-${var.environment}--LogAnalytics"
  location            = var.location
  resource_group_name = module.resource_group.name
  retention_in_days   = 30
  tags                = local.common_tags

}

#Recurso time para que monitor dcr espere y no se cree antes del log_analytics
resource "time_sleep" "wait_for_log_analytics" {
  depends_on = [module.log_analytics]

  create_duration = "30s"

  triggers = {
    workspace_id = module.log_analytics.log_analytics_id
  }
}


#Modulo del Monitor DCR
module "monitor_dcr" {
  source = "../../modules/monitor-dcr"

  name                       = "${var.project_name}-${var.environment}-monitordcr"
  location                   = var.location
  resource_group_name        = module.resource_group.name
  tags                       = local.common_tags
  log_analytics_workspace_id = module.log_analytics.log_analytics_id
  depends_on                 = [time_sleep.wait_for_log_analytics]

}

#Recurso de asignacion del Monitor DCR con la VM
resource "azurerm_monitor_data_collection_rule_association" "this" {
  name                    = "${var.project_name}-${var.environment}-dcr-association"
  target_resource_id      = module.virtual_machine.virtual_machine_id
  data_collection_rule_id = module.monitor_dcr.dcr_id
}



#Modulo del Monitor Agent
module "monitor_agent" {
  source = "../../modules/monitor-agent"

  name                 = "${var.project_name}-${var.environment}--monitoragent"
  virtual_machine_id   = module.virtual_machine.virtual_machine_id
  publisher            = "Microsoft.Azure.Monitor"
  type                 = "AzureMonitorWindowsAgent"
  type_handler_version = 1.2


}

#Modulo del Azure Key Vault
module "key_vault" {
  source = "../../modules/key-vault"

  name                = "azp-${var.security}-keyv"
  location            = var.location
  resource_group_name = module.security_resource_group.name
  tags                = local.common_tags

}