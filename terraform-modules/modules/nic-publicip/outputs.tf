# output "network_interface_id" {
#   description = "The ID of the network interface"
#   value       = azurerm_network_interface.network-interface.id
  
# }

output "network_interface_id" {
  value = [
    for nic in azurerm_network_interface.network-interface : nic.id
  ]
}
