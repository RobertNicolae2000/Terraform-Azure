# General Configuration

variable "resource_location" {
  description = "The location where the resource will be created"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

# Tagging

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

# Virtual Network Configuration

variable "virtual_network_name" {
  description = "The name of the virtual network"
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
}

# Subnet Configuration

variable "subnet_name" {
  description = "The names of the subnets"
  type        = list(string)
}

variable "subnet_address_prefixes" {
  description = "The address prefixes for the subnets"
  type        = list(string)
}

# Network Security Group

variable "network_security_group_id" {
  description = "The ID of the network security group"
  type        = string
}
