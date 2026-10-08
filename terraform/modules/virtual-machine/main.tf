resource "azurerm_windows_virtual_machine" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tags                = var.tags

  size           = var.size
  admin_username = var.admin_username
  admin_password = var.admin_password
  network_interface_ids = [
    var.network_interface_ids
  ]

  #Configuracion del disco
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }

  #Configuracion de la imagen del sistema

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-datacenter-azure-edition"
    version   = "latest"
  }

}