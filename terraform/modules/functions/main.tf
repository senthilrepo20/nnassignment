locals {
  os_type  = "Linux"
  sku_name = "P1v2"
}

#---------------------------------------------------------
# Storage Account Creation or selection 
#----------------------------------------------------------
resource "random_string" "unique" {
  length  = 6
  special = false
  upper   = false
}
resource "azurerm_service_plan" "nnassign_asp" {
  name                = var.appservice-plan-name
  location            = var.location
  resource_group_name = var.rgName
  os_type             = local.os_type
  sku_name            = local.sku_name

}

resource "azurerm_storage_account" "nnassignsg" {
  name                     = "nnassign${random_string.unique.id}"
  resource_group_name      = var.rgName
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_linux_function_app" "nnassign_func" {
  name                       = var.func-name
  location                   = var.location
  resource_group_name        = var.rgName
  service_plan_id            = azurerm_service_plan.nnassign_asp.id
  storage_account_name       = azurerm_storage_account.nnassignsg.name
  storage_account_access_key = azurerm_storage_account.nnassignsg.primary_access_key

  site_config {}
}

resource "azurerm_monitor_diagnostic_setting" "nnfuncdiag" {
  name               = "nnfuncdiag"
  target_resource_id = azurerm_linux_function_app.nnassign_func.id
  storage_account_id = azurerm_storage_account.nnassignsg.id

  enabled_log {
    category = "FunctionApplicationLogs"

    retention_policy {
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}