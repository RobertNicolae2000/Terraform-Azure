module "resource-group" {
  source = "../modules/resource-group"
  resource_location = local.resource_location
  tags = local.tags
  resource_group_name = local.resource_group_name
}

module "network-security-group" {
  source = "../modules/network-security-group"
  security_group_name = local.security_group_name
  location            = module.resource-group.location
  resource_group_name = module.resource-group.name
  tags = local.tags
}

module "storage-account" {
  source = "../modules/storage-account"
  storage_account_name = local.storage_account_name
  resource_group_name  = module.resource-group.name
  location            = module.resource-group.location
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

