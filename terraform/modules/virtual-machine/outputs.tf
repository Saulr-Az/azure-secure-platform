output "identity_id_vm" {
  description = "Id de la identidad de la vm"
  value       = azurerm_windows_virtual_machine.this.identity[0].principal_id

}

output "virtual_machine_id" {
  description = "ID del recurso de la máquina virtual"
  value       = azurerm_windows_virtual_machine.this.id
}