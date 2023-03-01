terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.45.0"
    }
    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 2.35.0"
    }
  }
  #the key should ideally be placed in a keyvault or in a environment variable so that it is not written in the disk
  backend "azurerm" {
    resource_group_name  = "nnterraform"
    storage_account_name = "nnterraform30986"
    container_name       = "nntfstatecname"
    key                  = "0RgtzU+noQs8DbNz9/fQeRvx9fV7XBFekN2S81eOQbXxFxgiY19pKZgNnosNVchkzndptpgZO+RQ+AStxmMd2g=="
  }
}

provider "azurerm" {
  features {}
  storage_use_azuread = true
}
