#Datos del almacenamiento que hemos creado por bootstrap
#En storage_account_name hay que ponerle el nombre que nos devuelva el bootstrap al crear la cuenta de almacenamiento
storage_account_name = "azportfoliost0cmn"

#Nombre del contenedor
container_name       = "statetf"

#Nombre del archivo que estara dentro del contenedor
key                  = "security.terraform.tfstate"

#Se debe autenticar a traves de Entra ID
use_azuread_auth     = true


#Usara las creedenciales de azure CLI para authenticarse
use_cli              = true