output "network_security_group_id" {
  description = "The ID of the network security group"
  value       = azurerm_network_security_group.sg.id
  
}