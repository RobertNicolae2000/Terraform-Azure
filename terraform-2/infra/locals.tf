locals {
  resource_group_name = "Dev"
  resource_location   = "North Europe"

  tags = {
    environment = "Dev"
  }
}

locals {
  virtual_network_name          = "dev-vnet"
  virtual_network_address_space = ["10.0.0.0/16"]

  subnet_name = ["subnet1", "subnet2", "subnet3"]
  subnet_address_prefixes = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

locals {
  security_group_name = "my-nsg"
}

locals {
  storage_account_name = "dev123robert"
  container_name       = "scripts"
  blob_name            = "blob1"
}

locals {
  network_interface_name = "dev-nic"
  public_ip_name         = "dev-public-ip"
  ip_configuration_name   = "dev-ip-config"
}

locals {
  vm_name = "dev-vm"
  vm_size = "Standard_DS1_v2"
}

locals {
  init_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y jq
  EOT
}

locals {
  vm_count = 2
}

locals {
  computer_name = "devlinux"
}
