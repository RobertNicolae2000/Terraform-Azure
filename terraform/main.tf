resource "azurerm_resource_group" "app-grp" {
  name     = "app-grp"
  location = local.resource_location
}

# resource "azurerm_storage_account" "appstore1231421" {
#   name                     = "appstore1231421"
#   resource_group_name      = azurerm_resource_group.app-grp.name
#   location                 = "North Europe"
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   account_kind = "StorageV2"
# }

# resource "azurerm_storage_container" "scripts" {
#   name                  = "scripts"
#   storage_account_id = azurerm_storage_account.appstore1231421.id
  
# }

# resource "azurerm_storage_blob" "parola" {
#   name                   = "parola"
#   storage_account_name   = azurerm_storage_account.appstore1231421.name
#   storage_container_name = "scripts"
#   type                   = "Block"
#   source                 = "parola"
#   access_tier = "Hot"
#   depends_on = [azurerm_storage_container.scripts]
# }

# Network Security Group
resource "azurerm_network_security_group" "sg" {
  name                = local.security_group
  location            = azurerm_resource_group.app-grp.location
  resource_group_name = azurerm_resource_group.app-grp.name
  security_rule {
    name                       = "allow-rdp"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

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

# Virtual Machine
resource "azurerm_windows_virtual_machine" "vm1" {
  name                = var.vm_name
  resource_group_name = azurerm_resource_group.app-grp.name
  location            = azurerm_resource_group.app-grp.location
  size                = "Standard_B2s"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.network-interface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

# Create and attack a Data Disk

resource "azurerm_managed_disk" "disk" {
  name                 = "${var.vm_name}-disk1"
  location             = azurerm_resource_group.app-grp.location
  resource_group_name  = azurerm_resource_group.app-grp.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk-attachment" {
  managed_disk_id    = azurerm_managed_disk.disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm1.id
  lun                = "10"
  caching            = "ReadWrite"
}