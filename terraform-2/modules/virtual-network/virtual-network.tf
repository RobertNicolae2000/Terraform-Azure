# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  address_space       = var.virtual_network_address_space
  tags = var.tags
}

# Subnet 1 and associated NSG
resource "azurerm_subnet" "subnet1" {
  name                 = var.subnet_name[0]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefixes[0]]
}

resource "azurerm_subnet_network_security_group_association" "subnet1-sg" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = var.network_security_group_id
}

# Subnet 2 and associated NSG
resource "azurerm_subnet" "subnet2" {
  name                 = var.subnet_name[1]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefixes[1]]
}

resource "azurerm_subnet_network_security_group_association" "subnet2-sg" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = var.network_security_group_id
}

# Subnet 3 and associated NSG
resource "azurerm_subnet" "subnet3" {
  name                 = var.subnet_name[2]
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [var.subnet_address_prefixes[2]]
}

resource "azurerm_subnet_network_security_group_association" "subnet3-sg" {
  subnet_id                 = azurerm_subnet.subnet3.id
  network_security_group_id = var.network_security_group_id
}