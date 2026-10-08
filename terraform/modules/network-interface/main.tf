resource "azurerm_network_interface" "this" {
  name                = var.name
  location            = var.location
  tags                = var.tags
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = var.private_ip_address_allocation
    #En caso que queramos poner la ip estatica  descomentar la linea private_ip_address
    #   private_ip_address = var.private_ip_address

    subnet_id = var.subnet_id
  }

}