# General configuration

variable "resource_location" {
  description = "The location where the resource group will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Tagging

variable "tags" {
  description = "Tags to be applied to the resource group"
  type        = map(string)
}