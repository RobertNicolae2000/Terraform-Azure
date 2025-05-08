# Network Interface and Public IP
resource "azurerm_network_interface" "network-interface" {
  name                = var.network_interface_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  tags = var.tags

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.vitual_network_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.webip.id
  }
}

resource "azurerm_public_ip" "webip" {
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.resource_location
  allocation_method   = "Static"
  tags = var.tags

}