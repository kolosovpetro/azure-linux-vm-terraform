#################################################################################################################
# RESOURCE GROUP
#################################################################################################################

resource "azurerm_resource_group" "public" {
  location = var.location
  name     = "rg-linux-vms-${var.prefix}"
}

#################################################################################################################
# VNET AND SUBNET
#################################################################################################################

resource "azurerm_virtual_network" "public" {
  name                = "vnet-${var.prefix}"
  address_space       = ["10.10.0.0/24"]
  location            = azurerm_resource_group.public.location
  resource_group_name = azurerm_resource_group.public.name
}

resource "azurerm_subnet" "internal" {
  name                 = "subnet-${var.prefix}"
  resource_group_name  = azurerm_resource_group.public.name
  virtual_network_name = azurerm_virtual_network.public.name
  address_prefixes     = ["10.10.0.0/26"]
}

#################################################################################################################
# VIRTUAL MACHINE (PUBLIC KEY AUTH)
#################################################################################################################

# module "ubuntu_vm_key_auth" {
#   source                      = "./modules/ubuntu-vm-key-auth"
#   resource_group_name         = azurerm_resource_group.public.name
#   resource_group_location     = azurerm_resource_group.public.location
#   subnet_id                   = azurerm_subnet.internal.id
#   ip_configuration_name       = "ipc-key-auth-vm-${var.prefix}"
#   network_interface_name      = "nic-key-auth-vm-${var.prefix}"
#   os_profile_computer_name    = "vm-key-auth-${var.prefix}"
#   storage_os_disk_name        = "osdisk-key-auth-vm-${var.prefix}"
#   vm_name                     = "vm-key-auth-${var.prefix}"
#   public_ip_name              = "pip-key-auth-vm-${var.prefix}"
#   os_profile_admin_public_key = file("${path.root}/id_ed25519.pub")
#   os_profile_admin_username   = "razumovsky_r"
#   network_security_group_id   = azurerm_network_security_group.public.id
# }

#################################################################################################################
# VIRTUAL MACHINE CUSTOM IMAGE (PUBLIC KEY AUTH)
#################################################################################################################

module "ubuntu_vm_custom_image_key_auth" {
  source                           = "./modules/ubuntu-vm-key-auth-custom-image"
  custom_image_resource_group_name = "rg-packer-images-linux"
  custom_image_sku                 = "azure-ubuntu-v6"
  ip_configuration_name            = "ipc-custom-image-key-${var.prefix}"
  network_interface_name           = "nic-custom-image-key-${var.prefix}"
  os_profile_admin_public_key      = file("${path.root}/id_ed25519.pub")
  os_profile_admin_username        = "razumovsky_r"
  os_profile_computer_name         = "vm-custom-image-key-${var.prefix}"
  public_ip_name                   = "pip-custom-image-key-${var.prefix}"
  resource_group_location          = azurerm_resource_group.public.location
  resource_group_name              = azurerm_resource_group.public.name
  storage_os_disk_name             = "osdisk-custom-image-key-${var.prefix}"
  subnet_id                        = azurerm_subnet.internal.id
  vm_name                          = "vm-custom-image-key-${var.prefix}"
  network_security_group_id        = azurerm_network_security_group.public.id
}

#################################################################################################################
# VIRTUAL MACHINE CUSTOM IMAGE (PUBLIC KEY AUTH) NO PIP
#################################################################################################################

# module "ubuntu_vm_custom_image_key_auth_no_pip" {
#   source                           = "./modules/ubuntu-vm-key-auth-custom-image-no-pip"
#   custom_image_resource_group_name = "rg-packer-images-linux"
#   custom_image_sku                 = "ubuntu2204-v1"
#   ip_configuration_name            = "ipc-custom-image-key2-${var.prefix}"
#   network_interface_name           = "nic-custom-image-key2-${var.prefix}"
#   os_profile_admin_public_key      = file("${path.root}/id_rsa.pub")
#   os_profile_admin_username        = "razumovsky_r"
#   os_profile_computer_name         = "vm-custom-image-key2-${var.prefix}"
#   resource_group_location          = azurerm_resource_group.public.location
#   resource_group_name              = azurerm_resource_group.public.name
#   storage_os_disk_name             = "osdisk-custom-image-key2-${var.prefix}"
#   subnet_id                        = azurerm_subnet.internal.id
#   vm_name                          = "vm-custom-image-key2-${var.prefix}"
#   network_security_group_id        = azurerm_network_security_group.public.id
# }

#################################################################################################################
# VIRTUAL MACHINE (PASSWORD AUTH)
#################################################################################################################

# module "ubuntu_vm_pass_auth" {
#   source                    = "./modules/ubuntu-vm-password-auth"
#   ip_configuration_name     = "pip-pass-auth-${var.prefix}"
#   network_interface_name    = "nic-pass-auth-${var.prefix}"
#   os_profile_admin_password = trimspace(file("${path.root}/password.txt"))
#   os_profile_admin_username = "razumovsky_r"
#   os_profile_computer_name  = "vm-pass-auth-${var.prefix}"
#   public_ip_name            = "pip-pass-auth-${var.prefix}"
#   resource_group_name       = azurerm_resource_group.public.name
#   resource_group_location   = azurerm_resource_group.public.location
#   storage_os_disk_name      = "osdisk-pass-auth-vm-${var.prefix}"
#   subnet_id                 = azurerm_subnet.internal.id
#   vm_name                   = "vm-pass-auth-${var.prefix}"
#   network_security_group_id = azurerm_network_security_group.public.id
# }

#################################################################################################################
# VIRTUAL MACHINE CUSTOM IMAGE (PASSWORD AUTH)
#################################################################################################################

# module "ubuntu_vm_pass_auth_custom_image" {
#   source                    = "./modules/ubuntu-vm-password-auth-custom-image"
#   ip_configuration_name     = "pip-custom-pass-${var.prefix}"
#   network_interface_name    = "nic-custom-pass-${var.prefix}"
#   os_profile_admin_password = trimspace(file("${path.root}/password.txt"))
#   os_profile_admin_username = "razumovsky_r"
#   os_profile_computer_name  = "vm-custom-pass-${var.prefix}"
#   public_ip_name            = "pip-custom-pass-${var.prefix}"
#   resource_group_name       = azurerm_resource_group.public.name
#   resource_group_location   = azurerm_resource_group.public.location
#   storage_os_disk_name      = "osdisk-custom-pass-${var.prefix}"
#   subnet_id                 = azurerm_subnet.internal.id
#   vm_name                   = "vm-custom-pass-${var.prefix}"
#   network_security_group_id = azurerm_network_security_group.public.id
# }

#################################################################################################################
# VIRTUAL MACHINE CUSTOM IMAGE (PASSWORD AUTH) NO PIP
#################################################################################################################

# module "ubuntu_vm_pass_auth_custom_image_no_pip" {
#   source                    = "./modules/ubuntu-vm-password-auth-custom-image-no-pip"
#   ip_configuration_name     = "pip-custom-pass2-${var.prefix}"
#   network_interface_name    = "nic-custom-pass2-${var.prefix}"
#   os_profile_admin_password = trimspace(file("${path.root}/password.txt"))
#   os_profile_admin_username = "razumovsky_r"
#   os_profile_computer_name  = "vm-custom-pass2-${var.prefix}"
#   resource_group_name       = azurerm_resource_group.public.name
#   resource_group_location   = azurerm_resource_group.public.location
#   storage_os_disk_name      = "osdisk-custom-pass2-${var.prefix}"
#   subnet_id                 = azurerm_subnet.internal.id
#   vm_name                   = "vm-custom-pass2-${var.prefix}"
#   network_security_group_id = azurerm_network_security_group.public.id
# }
