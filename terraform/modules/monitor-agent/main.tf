#Plantila para crear la relacion Agente que monitorizara las VMs
resource "azurerm_virtual_machine_extension" "this" {
  name                 = var.name
  virtual_machine_id   = var.virtual_machine_id
  publisher            = var.publisher
  type                 = var.type
  type_handler_version = var.type_handler_version
  #Habilitaremos las actulizaciones automaticas
  automatic_upgrade_enabled = true

}





