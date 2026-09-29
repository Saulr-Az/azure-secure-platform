Azure Secure Platform

Terraform-based Azure infrastructure project designed to demonstrate practical Azure administration, infrastructure as code, security, networking, identity, monitoring, and automation skills aligned with the AZ-104 Azure Administrator role.

Project Status

🚧 In progress

The platform is being built incrementally using Terraform and Azure best practices.

Objectives

This project aims to demonstrate:

Azure infrastructure deployment with Terraform
Modular Terraform architecture
Environment separation (dev / prod)
Azure networking and network segmentation
Security and access control
Identity and RBAC
Storage and data protection
Monitoring and observability
Infrastructure automation
CI/CD with GitHub Actions
Terraform state management
Repository Structure
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
Terraform Architecture

The project separates reusable infrastructure modules from environment-specific configuration.

Modules

The terraform/modules/ directory contains reusable Terraform modules.

For example:

terraform/modules/resource-group/
├── main.tf
├── variables.tf
└── outputs.tf
Environments

The terraform/environments/ directory contains the configuration for each environment.

terraform/environments/
├── dev/
└── prod/

Each environment can use the same Terraform modules with different configuration.

Current Implementation

The first implemented component is an Azure Resource Group deployed through a reusable Terraform module.

Current flow:

Environment
    ↓
Terraform Module
    ↓
Azure Resource Group

The development environment currently creates:

azportfolio-dev-rg

in the West Europe Azure region.

Terraform State

Terraform state is intentionally excluded from this repository.

The local state file:

terraform.tfstate

is used by Terraform to track the relationship between the Terraform configuration and the infrastructure it manages.

For a production-oriented implementation, the project will use remote Terraform state stored in Azure Storage.

Technologies
Microsoft Azure
Terraform
AzureRM Terraform Provider
PowerShell
Azure CLI
Git
GitHub
GitHub Actions
Project Roadmap

Terraform project structure

Resource Group module

Development environment

Azure Virtual Network

Subnets

Network Security Groups

Route tables

Storage

Key Vault

Managed Identity

Compute

Private Endpoints

Private DNS

Azure Monitor / Log Analytics

RBAC

Azure Policy

Production environment

Remote Terraform state

GitHub Actions CI/CD

Architecture documentation

Security documentation

Infrastructure deployment documentation
