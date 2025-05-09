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

# Public IP Configuration and Network Interface Configuration

variable "network_interface_name" {
  description = "The name of the network interface"
  type        = string
  
}

variable "public_ip_name" {
  description = "The name of the public IP address"
  type        = string
}

variable "ip_configuration_name" {
  description = "The name of the IP configuration"
  type        = string
}

variable "vitual_network_subnet_id" {
  description = "The ID of the virtual network subnet"
  type        = string
}

variable "vm_count" {
  description = "The number of instances to create"
  type        = number
}