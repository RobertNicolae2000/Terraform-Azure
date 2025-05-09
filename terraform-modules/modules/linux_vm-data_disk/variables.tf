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

# VM Configuration

variable "vm_name" {
  description = "Type the name of the VM"
  type        = string
}

variable "admin_username" {
  description = "Type the name of the admin user"
  type        = string
}

variable "admin_password" {
  description = "Type the password of the admin user"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Type the size of the VM"
  type        = string
}

# Network Configuration

variable "network_interface_id" {
  description = "The ID of the network interface"
  type        = list(string)
}

variable "init_script" {
  description = "The initialization script to be run on the VM"
  type        = string
}

variable "vm_count" {
  description = "The number of instances to create"
  type        = number
}

variable "computer_name" {
  description = "The computer name for the VM"
  type        = string
}