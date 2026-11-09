#Haremos la asignacion de la vm para que pueda acceder al contenedor
resource "azurerm_role_assignment" "this" {
  scope                = var.scope
  role_definition_name = var.role_definition_name
  principal_id         = var.principal_id
}