# Virtual Machine
resource "azurerm_windows_virtual_machine" "vm1" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.resource_location
  size                = "Standard_B2s"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    var.network_interface_id
  ]
  tags = var.tags

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
  location             = var.resource_location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk-attachment" {
  managed_disk_id    = azurerm_managed_disk.disk.id
  virtual_machine_id = azurerm_windows_virtual_machine.vm1.id
  lun                = "10"
  caching            = "ReadWrite"
}