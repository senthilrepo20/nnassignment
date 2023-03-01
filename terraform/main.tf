

resource "azurerm_resource_group" "az-resource-group" {
  name     = var.rgName
  location = var.location
}

data "azurerm_client_config" "current" {
}

/*
1. first install monitor module which will install log analytics workspace and application insights
2. Install Container registry
3. Install Functions - which will install app service plan, functions and storage
*/

module "monitor" {
  source = "./modules/monitor"
}
module "containerregistry" {
  source = "./modules/containerregistry"
}

module "functions" {
  source = "./modules/functions"
}

module "keyvault" {
  source = "./modules/keyvault"
}

