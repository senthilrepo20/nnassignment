locals {
  #loganalytics_name = "log${random_string.random.id}"
  loganalytics_SKU = "PerGB2018"
  loganalytics_ret = 30
  appinsights_type = "web"
}

#---------------------------------------------------------
# Storage Account Creation or selection 
#----------------------------------------------------------
resource "random_string" "unique" {
  length  = 6
  special = false
  upper   = false
}
resource "azurerm_log_analytics_workspace" "nnlaw" {
  name                = "log${random_string.unique.id}"
  location            = var.location
  resource_group_name = var.rgName
  sku                 = local.loganalytics_SKU
  retention_in_days   = local.loganalytics_ret
}

resource "azurerm_application_insights" "nnfuncinsights" {
  name                = "tf-test-appinsights"
  location            = var.location
  resource_group_name = var.rgName
  workspace_id        = azurerm_log_analytics_workspace.nnlaw.id
  application_type    = local.appinsights_type
}