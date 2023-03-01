variable "rgName" {
  description = "Name for the resource group"
  type        = string
  default     = "nnassignment-rg"
}
variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}
variable "acrName" {
  description = "Name of the keyvault"
  type        = string
  default     = "nnazurecontainerregistry"
}
variable "acrSKUName" {
  description = "Name of the keyvault"
  type        = string
  default     = "Basic"
}
variable "keyvaultName" {
  description = "Name of the keyvault"
  type        = string
  default     = "nn-app-kv"
}
variable "nnassignment-uai" {
  description = "User Assiged Managed Identity"
  type        = string
  default     = "nn-assign-uai"

}
variable "func-name" {
  description = "Function App Name"
  type        = string
  default     = "nnassign-func"
}

variable "appservice-plan-name" {
  description = "App Service Plan Name"
  type        = string
  default     = "nnassign-asp"
}
