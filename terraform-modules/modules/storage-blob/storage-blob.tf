resource "azurerm_storage_blob" "parola" {
  name                   = var.blob_name
  storage_account_name   = var.storage_account_name
  storage_container_name = var.container_name
  type                   = "Block"
  source                 = "parola"
  access_tier = "Hot"
}