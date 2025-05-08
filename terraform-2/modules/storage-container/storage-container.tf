resource "azurerm_storage_container" "scripts" {
  name                  = var.container_name
  storage_account_id = var.storage_account_id
}
