module "resource-group" {
  source = "../modules/resource-group"
  resource_location = local.resource_location
  tags = local.tags
  resource_group_name = local.resource_group_name
}

module "network-security-group" {
  source = "../modules/network-security-group"
  security_group_name = local.security_group_name
  resource_location = module.resource-group.resource_location
  resource_group_name = module.resource-group.name
  tags = local.tags
}

module "storage-account" {
  source = "../modules/storage-account"
  storage_account_name = local.storage_account_name
  resource_group_name  = module.resource-group.name
  resource_location    = module.resource-group.resource_location
  tags                = local.tags
}

module "storage-blob" {
  source = "../modules/storage-blob"
  blob_name          = local.blob_name
  container_name     = module.storage_container.name
  storage_account_name = module.storage-account.name
}

module "storage_container" {
  source = "../modules/storage-container"
  container_name     = local.container_name
  storage_account_id = module.storage-account.id
}

module "virtual_network" {
  source = "../modules/virtual-network"

  virtual_network_name          = local.virtual_network_name
  virtual_network_address_space = local.virtual_network_address_space
  resource_group_name           = module.resource-group.name
  resource_location             = module.resource-group.resource_location
  subnet_name                   = local.subnet_name
  subnet_address_prefixes       = local.subnet_address_prefixes
  network_security_group_id     = module.network-security-group.network_security_group_id
  tags = local.tags
}

module "nic-publicip" {
  source = "../modules/nic-publicip"

  vm_count                = local.vm_count
  network_interface_name = local.network_interface_name
  public_ip_name         = local.public_ip_name
  ip_configuration_name   = local.ip_configuration_name
  resource_group_name     = module.resource-group.name
  resource_location       = module.resource-group.resource_location
  tags                    = local.tags
  vitual_network_subnet_id = module.virtual_network.subnet_id[1]
}

# Retrieve secrets from Key Vault

data "azurerm_key_vault" "robert_vault" {
  name                = "KeyVault-Robert"
  resource_group_name = "KeyVault-RG"
}

data "azurerm_key_vault_secret" "admin_username" {
  name         = "admin-username"
  key_vault_id = data.azurerm_key_vault.robert_vault.id
}

data "azurerm_key_vault_secret" "admin_password" {
  name         = "admin-password"
  key_vault_id = data.azurerm_key_vault.robert_vault.id
}

module "linux_vm_data_disk" {
  source = "../modules/linux_vm-data_disk"

  vm_count = local.vm_count
  vm_name              = local.vm_name
  computer_name        = local.computer_name
  vm_size = local.vm_size
  admin_username       = data.azurerm_key_vault_secret.admin_username.value
  admin_password       = data.azurerm_key_vault_secret.admin_password.value
  resource_group_name  = module.resource-group.name
  resource_location    = module.resource-group.resource_location
  network_interface_id = module.nic-publicip.network_interface_id
  tags = local.tags
  init_script = local.init_script
}

