#Creamos el output para sacar el identificador de las subnets y asi poder asignarlas a nuestro NSG. 
output "azurerm_subnet_id" {

  description = "identificadores de la subnets creadas"
  value = {
    for name, subnet in azurerm_subnet.this :
    name => subnet.id
  }

}
