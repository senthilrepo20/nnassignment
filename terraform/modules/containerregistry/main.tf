# data "azuread_service_principal" "az-sp" {
#   object_id = "d77928c4-4a08-42ad-8670-e17c2b1d0b5a"
# }
# terraform {
#   required_version = "~>1.3.7"
# }
resource "azurerm_container_registry" "nn-acr" {
  name                = var.acrName
  resource_group_name = var.rgName
  location            = var.location
  sku                 = var.acrSKUName


}

resource "azurerm_user_assigned_identity" "user-managed-identity" {
  resource_group_name = var.rgName
  location            = var.location
  name                = var.nnassignment-uai
}
data "azurerm_client_config" "current" {}




## Managed Identity - ACRPull permissions
resource "azurerm_role_assignment" "acr-nn-pull-role" {
  scope                = azurerm_container_registry.nn-acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_user_assigned_identity.user-managed-identity.principal_id
}

## Owner permissions
resource "azurerm_role_assignment" "acr-nn-Owner-role" {
  scope                = azurerm_container_registry.nn-acr.id
  role_definition_name = "Owner"
  principal_id         = data.azurerm_client_config.current.client_id
}

## ServicePrincipal - CI/CD
# resource "azurerm_role_assignment" "acr-nn-contributor-role" {
#   scope                = azurerm_container_registry.nn-acr.id
#   role_definition_name = "Contributor"
#   principal_id         = data.azuread_service_principal.az-sp.object_id
# }