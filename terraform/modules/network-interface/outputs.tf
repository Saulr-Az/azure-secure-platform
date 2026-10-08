output "network_interface_ids" {
  description = "Identificador del NIC"
  value       = azurerm_network_interface.this.id
}