resource "azurerm_network_security_group" "sg" {
  name                = var.security_group_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  security_rule {
    name                       = "allow-ssh"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = var.tags
}