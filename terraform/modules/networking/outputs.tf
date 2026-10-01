output "azurerm_subnet_id" {
    
    description = "identificadores de la subnets creadas"
    value       = {
        for name, subnet in azurerm_subnet.this :
               name => subnet.id
    }

}