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