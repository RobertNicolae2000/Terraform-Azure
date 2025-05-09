# Virtual Machine
resource "azurerm_linux_virtual_machine" "vm1" {
  count             = var.vm_count
  name                = "${var.vm_name}${count.index}"
  computer_name       = "${var.computer_name}${count.index}"
  resource_group_name = var.resource_group_name
  location            = var.resource_location
  size                = "Standard_B1ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    var.network_interface_id[count.index]
  ]
  tags = var.tags
  disable_password_authentication = false

  os_disk {
    name             = "${var.vm_name}-osdisk-${count.index}"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-lts"
    version   = "latest"
  }
  
  custom_data = base64encode(var.init_script)
}

# Create and attach a Data Disk

resource "azurerm_managed_disk" "disk" {
  count               = var.vm_count
  name                 = "${var.vm_name}-disk-${count.index}"
  location             = var.resource_location
  resource_group_name  = var.resource_group_name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 10
  tags = var.tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "disk-attachment" {
  count             = var.vm_count
  managed_disk_id    = azurerm_managed_disk.disk[count.index].id
  virtual_machine_id = azurerm_linux_virtual_machine.vm1[count.index].id
  lun                = "10"
  caching            = "ReadWrite"
}