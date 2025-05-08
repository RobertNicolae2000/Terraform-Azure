# Network Interface and Public IP
resource "azurerm_network_interface" "network-interface" {
  name                = local.network_interface.name
  location            = azurerm_resource_group.app-grp.location
  resource_group_name = azurerm_resource_group.app-grp.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet2.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.webip.id
  }
}

resource "azurerm_public_ip" "webip" {
  name                = "public-ip-1"
  resource_group_name = azurerm_resource_group.app-grp.name
  location            = azurerm_resource_group.app-grp.location
  allocation_method   = "Static"

}