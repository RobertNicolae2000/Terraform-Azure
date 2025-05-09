# General Configuration

variable "resource_location" {
  description = "Azure region where the storage account will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group where the storage account will be created"
  type        = string
}

# Storage Configuration

variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
}

# Tagging

variable "tags" {
  description = "Tags to be applied to the storage account"
  type        = map(string)
}
