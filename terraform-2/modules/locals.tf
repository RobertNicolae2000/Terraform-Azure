locals {
  resource_location = "North Europe"
  security_group = "security-group"
  subnet = {
    name   = ["subnet1","subnet2","subnet3"]
    address_prefixes = ["10.0.0.0/24","10.0.1.0/24","10.0.2.0/24"]
}
  virtual_network={
    name = "virtual-network"
    address_space = ["10.0.0.0/16"]
  }
  network_interface = {
    name = "network-interface"
  }
}
