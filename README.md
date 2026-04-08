# Azure Linux VM Terraform

Terraform modules for Azure Linux Virtual machines

- VM with public key authentication
- VM with custom image and public key authentication
- VM with custom image and public key authentication no public ip
- VM with password authentication
- VM with custom image and password authentication
- VM with custom image and password authentication no public ip

## Examples

**VM with public key authentication**

```hcl
module "ubuntu_vm_key_auth" {
  source                    = "github.com/kolosovpetro/azure-linux-vm-terraform.git//modules/ubuntu-vm-key-auth?ref=master"
  resource_group_name       = azurerm_resource_group.public.name
  resource_group_location   = azurerm_resource_group.public.location
  subnet_id                 = azurerm_subnet.internal.id
  ip_configuration_name     = "ipc-key-auth-vm-${var.prefix}"
  network_interface_name    = "nic-key-auth-vm-${var.prefix}"
  os_profile_computer_name  = "vm-key-auth-${var.prefix}"
  storage_os_disk_name      = "osdisk-key-auth-vm-${var.prefix}"
  vm_name                   = "vm-key-auth-${var.prefix}"
  public_ip_name            = "pip-key-auth-vm-${var.prefix}"
  os_profile_admin_public_key = file("${path.root}/id_rsa.pub")
  os_profile_admin_username = "razumovsky_r"
  network_security_group_id = azurerm_network_security_group.public.id
}
```

**VM with custom image and public key authentication**

```hcl
module "ubuntu_vm_custom_image_key_auth" {
  source                           = "github.com/kolosovpetro/azure-linux-vm-terraform.git//modules/ubuntu-vm-key-auth-custom-image?ref=master"
  custom_image_resource_group_name = "rg-packer-images-linux"
  custom_image_sku                 = "ubuntu2204-v1"
  ip_configuration_name            = "ipc-custom-image-key-${var.prefix}"
  network_interface_name           = "nic-custom-image-key-${var.prefix}"
  os_profile_admin_public_key = file("${path.root}/id_rsa.pub")
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
```

**VM with custom image and public key authentication no public ip**

```hcl
module "ubuntu_vm_custom_image_key_auth_no_pip" {
  source                           = "github.com/kolosovpetro/azure-linux-vm-terraform.git//modules/ubuntu-vm-key-auth-custom-image-no-pip"
  custom_image_resource_group_name = "rg-packer-images-linux"
  custom_image_sku                 = "ubuntu2204-v1"
  ip_configuration_name            = "ipc-custom-image-key2-${var.prefix}"
  network_interface_name           = "nic-custom-image-key2-${var.prefix}"
  os_profile_admin_public_key      = file("${path.root}/id_rsa.pub")
  os_profile_admin_username        = "razumovsky_r"
  os_profile_computer_name         = "vm-custom-image-key2-${var.prefix}"
  resource_group_location          = azurerm_resource_group.public.location
  resource_group_name              = azurerm_resource_group.public.name
  storage_os_disk_name             = "osdisk-custom-image-key2-${var.prefix}"
  subnet_id                        = azurerm_subnet.internal.id
  vm_name                          = "vm-custom-image-key2-${var.prefix}"
  network_security_group_id        = azurerm_network_security_group.public.id
}
```

**VM with password authentication**

```hcl
module "ubuntu_vm_pass_auth" {
  source                    = "github.com/kolosovpetro/azure-linux-vm-terraform.git//modules/ubuntu-vm-password-auth?ref=master"
  ip_configuration_name     = "pip-pass-auth-${var.prefix}"
  network_interface_name    = "nic-pass-auth-${var.prefix}"
  os_profile_admin_password = trimspace(file("${path.root}/password.txt"))
  os_profile_admin_username = "razumovsky_r"
  os_profile_computer_name  = "vm-pass-auth-${var.prefix}"
  public_ip_name            = "pip-pass-auth-${var.prefix}"
  resource_group_name       = azurerm_resource_group.public.name
  resource_group_location   = azurerm_resource_group.public.location
  storage_os_disk_name      = "osdisk-pass-auth-vm-${var.prefix}"
  subnet_id                 = azurerm_subnet.internal.id
  vm_name                   = "vm-pass-auth-${var.prefix}"
  network_security_group_id = azurerm_network_security_group.public.id
}
```

**VM with custom image and password authentication**

```hcl
module "ubuntu_vm_pass_auth_custom_image" {
  source                    = "github.com/kolosovpetro/azure-linux-vm-terraform.git//modules/ubuntu-vm-password-auth-custom-image?ref=master"
  ip_configuration_name     = "pip-custom-pass-${var.prefix}"
  network_interface_name    = "nic-custom-pass-${var.prefix}"
  os_profile_admin_password = trimspace(file("${path.root}/password.txt"))
  os_profile_admin_username = "razumovsky_r"
  os_profile_computer_name  = "vm-custom-pass-${var.prefix}"
  public_ip_name            = "pip-custom-pass-${var.prefix}"
  resource_group_name       = azurerm_resource_group.public.name
  resource_group_location   = azurerm_resource_group.public.location
  storage_os_disk_name      = "osdisk-custom-pass-${var.prefix}"
  subnet_id                 = azurerm_subnet.internal.id
  vm_name                   = "vm-custom-pass-${var.prefix}"
  network_security_group_id = azurerm_network_security_group.public.id
}
```

**VM with custom image and password authentication no public ip**

```hcl
module "ubuntu_vm_pass_auth_custom_image_no_pip" {
  source                    = "github.com/kolosovpetro/azure-linux-vm-terraform.git//modules/ubuntu-vm-password-auth-custom-image-no-pip"
  ip_configuration_name     = "pip-custom-pass2-${var.prefix}"
  network_interface_name    = "nic-custom-pass2-${var.prefix}"
  os_profile_admin_password = trimspace(file("${path.root}/password.txt"))
  os_profile_admin_username = "razumovsky_r"
  os_profile_computer_name  = "vm-custom-pass2-${var.prefix}"
  resource_group_name       = azurerm_resource_group.public.name
  resource_group_location   = azurerm_resource_group.public.location
  storage_os_disk_name      = "osdisk-custom-pass2-${var.prefix}"
  subnet_id                 = azurerm_subnet.internal.id
  vm_name                   = "vm-custom-pass2-${var.prefix}"
  network_security_group_id = azurerm_network_security_group.public.id
}

```

## Notes

- Print available azure vm images:
  - `az vm image list`
  - https://learn.microsoft.com/en-us/cli/azure/vm/image?view=azure-cli-latest#az-vm-image-list
- Print available azure vm sizes:
  - `az vm list-sizes -l "northeurope"`
  - `az vm list-skus -l "northeurope" --size Standard_B4ms`
  - https://docs.microsoft.com/en-us/cli/azure/vm?view=azure-cli-latest#az-vm-list-sizes

## Terraform modules used

- https://azure.microsoft.com/es-es/blog/chocolatey-with-custom-script-extension-on-azure-vms/
- https://devkimchi.com/2020/08/26/app-provisioning-on-azure-vm-with-chocolatey-for-live-streaming/
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_interface_security_group_association
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule
- https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/virtual_machine_extension
- https://stackoverflow.com/questions/48653350/what-goes-in-the-ssh-keys-key-data-argument-in-a-terraform-template
- https://linux.how2shout.com/how-to-install-powershell-on-ubuntu-22-04-lts/
