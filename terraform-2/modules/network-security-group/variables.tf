variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "security_group_name" {
  type = string
}

variable "tags" {
  description = "Tags to be applied to the network security group"
  type        = map(string)
}