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
  default     = "Standard_B2s"
}

variable "client_secret" {
  type      = string
  sensitive = true
}

variable "client_id" {
  type        = string
  description = "Client ID of the service principal"
}
variable "tenant_id" {
  type        = string
  description = "Tenant ID of the service principal"
}
variable "subscription_id" {
  type        = string
  description = "Subscription ID of the service principal"
}