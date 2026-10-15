Azure Secure Platform — Arquitectura

## RESUMEN

Azure Secure Platform es una plataforma personal de Infraestructure as Code (IaC) construida con Terraform para desplegar de manera modular recurisos de Azure

El projecto ahora solo tiene  Networking pero se ira implementando mas con el tiempo. 

## Diagrama de la arquitectura

Subscripcion Az
└── RG
    └── azportfolio-dev-rg
        │
        ├── VNET
        │   └── azportfolio-dev-vnet
        │       ├── subnet app
        │       │   └── Network Interface (NIC)
        │       │       └── Windows Virtual Machine
        │       │
        │       ├── subnet data
        │       │
        │       └── subnet management
        │
        └── Network Security Group
            └── azportfolio-dev-nsg
                └── Inbound HTTPS rule
                    ├── Protocol: TCP
                    ├── Port: 443
                    └── Access: Allow

3. Network Configuration
| Red Virtual | `azportfolio-dev-vnet`|
| rango de ip | `10.10.0.0/16` |
| App subnet | `10.10.1.0/24` |
| Data subnet | `10.10.2.0/24` |
| Management subnet | `10.10.3.0/24`|
| NSG | `azportfolio-dev-nsg` |
| Regla de seguridad | `Permitir-HTTPS-Inbound` |
| Rule direction | Inbound |
| Protocol | TCP |
| Destination port | 443 |
| Action | Allow |

## Estructura del Terraform

```text
azure-secure-platform/
├── terraform/
│   ├── environments/
│   │   └── dev/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       ├── outputs.tf
│   │       ├── providers.tf
│   │       └── ...
│   │
│   └── modules/
│       ├── resource-group/
│       ├── networking/
│       ├── network-security-group/
│       ├── network-interface/
│       └── virtual-machine/
│
├── .gitignore
└── README.md


environments/dev define el entorno de desarollo e implementa los valores de la configuracion para poder reutilizarse

modules contiene  todas las deficiniones del recursos por cada componente del proyecto. 
