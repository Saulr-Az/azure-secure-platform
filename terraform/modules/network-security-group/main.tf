#Crearemos el recurso NSG 
resource "azurerm_network_security_group" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

#Crearemos la regla NSG que permite que el trafico entrante por el puerto de HTTPS
resource "azurerm_network_security_rule" "this" {
  name                        = "Permitir-HTTPS-Entrante"
  priority                    = var.priority
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_address_prefix       = "Internet"
  destination_address_prefix = "*"
  destination_port_range      = "443"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.this.name
}


