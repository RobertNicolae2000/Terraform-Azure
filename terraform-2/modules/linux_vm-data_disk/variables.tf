variable "vm_name" {
  description = "Type the name of the VM"
  type        = string
  default = "vm-robert"
}

variable "admin_username" {
  description = "Type the name of the admin user"
  type        = string
  default = "robert-admin"
}

variable "admin_password" {
  description = "Type the password of the admin user"
  type        = string
  sensitive   = true
  default = "Password1234!"
}

variable "vm_size" {
  description = "Type the size of the VM"
  type        = string
  default     = "Standard_B2s"
}