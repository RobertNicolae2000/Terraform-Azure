# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = local.virtual_network.name
  location            = local.resource_location
  resource_group_name = azurerm_resource_group.app-grp.name
  address_space       = local.virtual_network.address_space
}

# Subnet 1 and associated NSG
resource "azurerm_subnet" "subnet1" {
  name                 = local.subnet.name[0]
  resource_group_name  = azurerm_resource_group.app-grp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.subnet.address_prefixes[0]]
}

resource "azurerm_subnet_network_security_group_association" "subnet1-sg" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.sg.id
}

# Subnet 2 and associated NSG
resource "azurerm_subnet" "subnet2" {
  name                 = local.subnet.name[1]
  resource_group_name  = azurerm_resource_group.app-grp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.subnet.address_prefixes[1]]
}

resource "azurerm_subnet_network_security_group_association" "subnet2-sg" {
  subnet_id                 = azurerm_subnet.subnet2.id
  network_security_group_id = azurerm_network_security_group.sg.id
}

# Subnet 3 and associated NSG
resource "azurerm_subnet" "subnet3" {
  name                 = local.subnet.name[2]
  resource_group_name  = azurerm_resource_group.app-grp.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = [local.subnet.address_prefixes[2]]
}

resource "azurerm_subnet_network_security_group_association" "subnet3-sg" {
  subnet_id                 = azurerm_subnet.subnet3.id
  network_security_group_id = azurerm_network_security_group.sg.id
}