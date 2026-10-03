#Sacar el identificador del NSG

output "network_security_group_id" {
  description ="ID de nuestro NSG"
  value = azurerm_network_security_group.this.id
}

