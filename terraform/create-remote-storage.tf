# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "=3.45.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }
# resource "random_string" "resource_code" {
#   length  = 5
#   special = false
#   upper   = false
# }
# resource "azurerm_resource_group" "az-resource-group" {
#   name     = var.rgName
#   location = var.location
# }
# resource "azurerm_storage_account" "tfstate" {
#   name                     = "tfstate${random-string.resource_code.result}"
#   resource_group_name      = var.rgName
#   location                 = var.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   allow_blob_public_access = false
# }
# resource "azurerm_storage_container" "tfstate" {
#   name                  = "tfstate"
#   storage_account_name  = azurerm_storage_account.tfstate.name
#   container_access_type = "private"
# }