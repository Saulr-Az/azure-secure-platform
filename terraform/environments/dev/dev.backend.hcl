#Datos del almacenamiento que hemos creado por bootstrap
#En storage_account_name hay que ponerle el nombre que nos devuelva el bootstrap al crear la cuenta de almacenamiento
storage_account_name = "azportfoliost0cmn"
container_name       = "statetf"
key                  = "dev.terraform.tfstate"
use_azuread_auth     = true
use_cli              = true