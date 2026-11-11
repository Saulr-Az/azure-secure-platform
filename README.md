**Azure Secure Platform**

Infraestructura montada en Terraform  con una arquitectura modular, controles basados en identidad y test de validacion a traves de Github Actions

**Entornos y comunicacion entre ellos**

Cada entorno dispone de su propio estado remoto guardado en Azure Storage:
  •	security.terraform.tfstate
  •	dev.terraform.tfstate
  •	prod.terraform.tfstate (para mas adelante)
El entorno dev recoje la información de  los outputs publicados por security, así evitamos  duplicar recursos o gestiones rbac.


**PREREQUISITOS ANTES DE CREAR**

Para poder autenticarte en los github Actions:
Crear los secretos en github dandole los siguientes valores:

**AZURE_CLIENT_ID:** 

El ID de tu app registrada en tu Microsoft Entra ID

**AZURE_TENANT_ID:**

ID de tu tenant de Azure

**AZURE_SUSCRIPTION_ID** 

ID de tu suscripcion de Azure donde se desplegaran los recursos.



**PARA PODER IMPLEMENTAR EL BACKEND:**

1.Se debe lanzar primero el bootstrap,

2.Despues recoger el output con el nombre que te dará de StorageAccount y ponerlo en "storage_account_name" azure-secure-platform/terraform/environments/dev/dev.backend.hcl y de azure-secure-platform/terraform/environments/security/security.backend.hcl

3. Desplegar el Entorno de security.

4. Luego dentro del grupo que hemos  creado  con el entorno de seguridad (azportfolio-security-rg), entramos al Key vault azp-security-keyv y creamos el secreto vm1-admin-password
  
5.Luego el usuario que despliegue el entorno de  dev, debe tener asignado el rol de Storage Blob Data Contributor en la cuenta de almacenamiento creada por bootstrap. 

**TENER EN CUENTA**
Github debe tener permissos de Storage Blob Data Contributor para poder acceder al backend remoto. 




Estado del projecto

**Version funcional completada**
**PENDIENTE:** 
-Kubernetes
-Ansible
-Implementar Diagrama de toda la arquitectura



**Acciones demostradas:**

Creacion y Configuracion de recursos
Architectura Terraform
Identidad y RBAC
Automatizacion de la Arquitectura
Implementacion con Github
Monitorizacion a traves de Azure Monitor
Backend Remoto y Azure Storage para almacenarlos
Implementacion de Key Vault y contener secretos

**Arquitectura implementada**

****NETWORKING****

Resource Group.

VNet

Subredes [app, data y management].

Network Security Group (NSG) y reglas de seguridad.

Asociaciones del NSG a las subredes.

Network Interface (NIC).

**Compute**

Maquina Virtual

Managed Identity asignada a la vm.

**Storage**

Azure Storage Account

Blob Storage Container

Permisos de acceso mediante Azure RBAC

**Identity and Access Management**

Asignacion de permissos controlada en Blob Storage

Asignado permiso Blob Storage Container 

**MONITOR**

Log analytics

dcr

Azure Monitor Extension

**BACKEND REMOTO**


****NETWORKING****



****Resource Group****

El grupo de recursos donde se guardara todo, se llamara: azportfolio-dev-rg

Le indicamos que use de nombre las variables de azure-secure-platform/terraform/environments/dev/variables.tf:
"environment" y"project_name" y luego añada rg, asi por si hay que cambiar el nombre solo hay que cambiar el valor, esto lo aplicaremos en gran parte de los recursos
  

****VNet****

Nuestra Red virtual (azportfolio-dev-vnet) con la dirrecion "10.10.0.0/16"

contiene las subredes app, data y management.



****Subredes [app, data y management].****

Las subredes tendran las siguientes ips:

app ->["10.10.1.0/24"]
    

data -> ["10.10.2.0/24"]
    

management -> ["10.10.3.0/24"]

Estas subredes estaran asignadas al NSG que indicamos ahora. 

****Network Security Group (NSG) y reglas de seguridad.****

Para realizar pruebas con Network Security group(azportfolio-dev-nsg), 
le he añadido la regla de entrada para que permita el traffico por HTTPS a traves del protocolo TCP de cualquier puerto de origen, de destino puerto 443.

**NIC**

He creado la targeta de red (azportfolio-dev-nic)
con una ip dinamica de la subnet de app, en la configuracion esta marcado en un comentario la dirrecion 10.10.1.6 en caso de desmarcarlo y configurar la ip estatica
(marcandola como statica en el private_ip_address_allocation)

azportfolio-dev-nic esta asignado a la vm project-vm


**Maquina Virtual**

La maquina virtual le tuve que poner azportfolio-vm ya que no me dejaba añadirle "dev" al nombre...
el tamañp que usaremos es: Standard_D2s_v3 debido que en la region que estamos trabajando cuando he realizado las pruebas no estaban disponibles modelos mas asequibles a un windows Server.
La contraseña de admin la solicitara por teclado cuadno se ejecute.

****Managed Identity****

Asignado el rol Storage Data Reader en la VM para luego poder acceder a los blobs del data storage que crearemos.

****STORAGE****

****Azure Storage Account****

Creamos una variable aleatoria para que no de problemas cada vez que creamos una cuenta de almacenamiento nueva. 
Configurado con TLS 1.2, contiene un contenedor Blob

**Blob Storage Container**

Lo nombre container01, he subido un blob para realizar una prueba que esta adjuntada en la documentacion de este git para confirmar que la vm puede acceder al Storage account. 

**Permisos de acceso mediante Azure RBAC**
A traves de RBAC le indicamos que la azportfolio-vm tiene el rol de Storage Blob Data Reader en container01

****MONITOR****
Implementado un log-analitcs,el DCR que define lo que se recopilara, y la extension de azure monitor aplicada en la vm. 

**Log analitics**
Consultara los datos recopilados por el DCR.
**dcr**
Recopila los eventos de Microsoft events, de las categorias Sistema y Aplicacion de los niveles 1,2 y 3.
Se ha aplicado un retraso de 30 segundos al crearse para que no se cree antes de Log Analitics y de error.

**Azure Monitor Extension**
La extension se ha aplicado en la vm del proyecto, recopilara los datos para poder revisarlos a traves de log analytics

****ESTRUCTURA PRINCIPAL****

terraform/

├── .github/

│   └──/workflows

├── environments/

│   └── dev/

└── modules/

│   ├── log-analytics/

│   ├── monitor-agent

│   ├── monitor-dcr
    
│   ├──  network-interface/
    
│   ├── network-security-group/ 
    
│   ├── networking/

│   ├── rbac/
    
│   ├── resource-group/
    
│   ├── storage-account/
    
│   ├── storage-container/
    
│   └── virtual-machine/


**GitHub Actions y OIDC**

Localizado en .github/workflows

El workflow automatiza las validaciones de Terraform y ejecuta terraform plan  para comprovar los eventos configurados del repositorio.

Este worflow consiste en:

Revision del repositorio.

Autenticación con Azure mediante OIDC.

Arranque de Terraform.

Validacion del formato y de la configuración.

Revision de los recursos a traves del plan. 




PROGRESO ACTUAL:


Estructura del projecto Terraform  DONE

Modulo RG DONE

Desarollo del entorno DONE

VNET DONE 

Subredes DONE

NSG  DONE

Asociaciacion NSG DONE

NIC DONE

Azure Storage DONE

Managed Identity DONE

Azure Monitor DONE
RBAC DONE

GitHub Actions CI/CD DONE

Documentation DONE
