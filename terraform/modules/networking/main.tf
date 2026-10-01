#Plantila de como crearemos el modulo para automatizar una vnet

resource "azurerm_virtual_network" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space
  tags                = var.tags


}

#Aqui el modulo para crear las subnets

resource "azurerm_subnet" "this" {
  # Le estamos diciendo que hay que repetir este proceso por cada subnet 
  for_each = var.subnets

  name                = each.key
  resource_group_name = var.resource_group_name
  #Aqui le decimos que se cree en nuestra vnet
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = each.value.address_prefixes

}
