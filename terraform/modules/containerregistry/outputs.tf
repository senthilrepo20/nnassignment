output "acr_name" {
  description = "Name of the Azure Container registry"
  value       = azurerm_container_registry.nn-acr.name
}