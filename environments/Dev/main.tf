# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"

    }
    consul = {
      source = "hashicorp/consul"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = <token_id>
}

resource "azurerm_resource_group" "this" {
  name     = "rg-${var.tags.application}-${var.tags.environment}"
  location = "eastus"
}




module azurerm-windows-webapp {
  source           =   source = "git::https://<<PAT>>@dev.azure.com/<ADO_ORG>>/<<ADO_PROJECT>>>/_git/<<ADO_REPO>>"
  rg = {
    location = azurerm_resource_group.this.location
    name     = azurerm_resource_group.this.name
  }
}
