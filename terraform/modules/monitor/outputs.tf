output "loganalytics_name" {
  description = "Name of the LogAnalytics Workspace"
  value       = azurerm_log_analytics_workspace.nnlaw.name
}
output "instrumentation_key" {
  description = "Application Insights Instrumentation key"
  value       = azurerm_application_insights.nnfuncinsights.instrumentation_key
}

output "app_id" {
  description = "Application Insights App ID"
  value       = azurerm_application_insights.nnfuncinsights.app_id
}