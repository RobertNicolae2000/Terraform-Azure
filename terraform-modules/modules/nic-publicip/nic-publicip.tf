# Network Interface and Public IP
resource "azurerm_network_interface" "network-interface" {
  count              = var.vm_count
  name                = "${var.network_interface_name}-${count.index}"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  tags = var.tags

  ip_configuration {
    name                          = var.ip_configuration_name
    subnet_id                     = var.vitual_network_subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.webip[count.index].id
  }
  depends_on = [azurerm_public_ip.webip]
}

resource "azurerm_public_ip" "webip" {
  count             = var.vm_count
  name                = "${var.public_ip_name}-${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.resource_location
  allocation_method   = "Static"
  tags = var.tags

}