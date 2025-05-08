resource "azurerm_resource_group" "app-grp" {
  name     = var.resource_group_name
  location = var.resource_location
  tags = var.tags
}