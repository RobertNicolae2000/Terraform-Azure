locals {
  workspace_suffix = lower(terraform.workspace)
}

locals {
  resource_group_name = "${local.workspace_suffix}-rg"
  resource_location   = "North Europe"

  tags = {
    environment = terraform.workspace
  }
}

locals {
  virtual_network_name          = "${local.workspace_suffix}-vnet"
  virtual_network_address_space = ["10.0.0.0/16"]

  subnet_name = ["${local.workspace_suffix}-subnet1", "${local.workspace_suffix}-subnet2", "${local.workspace_suffix}-subnet3"]
  subnet_address_prefixes = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

locals {
  security_group_name = "${local.workspace_suffix}-nsg"
}

locals {
  storage_account_name = "${local.workspace_suffix}123robert"
  container_name       = "scripts"
  blob_name            = "blob1"
}

locals {
  network_interface_name = "${local.workspace_suffix}-nic"
  public_ip_name         = "${local.workspace_suffix}-public-ip"
  ip_configuration_name   = "${local.workspace_suffix}-ip-config"
}

locals {
  vm_name = "${local.workspace_suffix}-vm"
  vm_size = "Standard_DS1_v2"
  computer_name = "${local.workspace_suffix}linux"
  vm_count = 2
}

locals {
  init_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y jq
  EOT
}
