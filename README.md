Azure Secure Platform

Infraestructura montada en Terraform  montada

Estado del projecto

EN PROGRESO

Practicando contruyendo la plantaforma incremnetalmente usando Terraform y Azure.

Objetivos a demostrar:
Creacion y Configuracion de recursos
Architectura Terraform
Identidad y RBAC
Monitorage
Automatizacion de la Arquitectura
Seguridad y control de acceso
Implementacion con Github

Architectura actual:
azure-secure-platform/
│
├── README.md
├── .gitignore
│
├── docs/
│
├── terraform/
│   ├── modules/
│   │   └── resource-group/
│   │
│   └── environments/
│       ├── dev/
│       └── prod/
│
└── scripts/

PROGRESO ACTUAL:


Estructura del projecto Terraform  DONE

Modulo RG DONE

Desarollo del entorno DONE

VNET DONE 

Subredes DONE

NSG  DONE

Asociaciacion NSG DONE

NIC DONE

Azure Storage

Key Vault

Managed Identity

Azure Monitor / Log Analytics

RBAC

Azure Policy

Production environment

Remote Terraform state

GitHub Actions CI/CD

Architecture documentation

Security documentation

Infrastructure deployment documentation
