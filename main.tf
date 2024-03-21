terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }

  cloud {
    organization = "ACG-Terraform-Labs22424"

    workspaces {
      name = "hands-on-with_terraform_on_azure"
    }
  }
}

provider "azurerm" {
  features {

  }
  skip_provider_registration = true
}

resource "azurerm_resource_group" "rg" {
  name     = "813-8e429385-hands-on-with-terraform-on-azure"
  location = "West US"
}

module "securestorage" {
  source               = "app.terraform.io/ACG-Terraform-Labs22424/securestroage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.name
  resource_group_name = azurerm_resource_group.rg.name
  storage_account_name = "vlady3r3t5"
  # insert required variables here
}
