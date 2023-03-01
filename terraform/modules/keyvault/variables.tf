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

variable "keyvaultName" {
  description = "Name of the keyvault"
  type        = string
  default     = "nn-app-kv"
}

