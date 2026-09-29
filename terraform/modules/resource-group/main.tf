#Plantilla de como crearemos el modulo para poder automatizar la creacion del grupo de recursos
resource "azurerm_resource_group" "this" {
  name     = var.name
  location = var.location
  tags     = var.tags
}