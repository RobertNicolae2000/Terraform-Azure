output "subnet_id" {
  description = "List of subnet IDs in order"
  value = [
    azurerm_subnet.subnet1.id,
    azurerm_subnet.subnet2.id,
    azurerm_subnet.subnet3.id
  ]
}