#Con este output sacaremos el identificador de la cuenta de almacenamiento para referenciarlo en un futuro
output "storage_account_id" {

  description = "identificador de la cuenta de almacenamiento"
        value = azurerm_storage_account.this.id
  }

#Con este el nombre del la cuenta

output "storage_account_name" {
    description = "Nombre de la cuenta de almacenamiento"
    value = azurerm_storage_account.this.name

}