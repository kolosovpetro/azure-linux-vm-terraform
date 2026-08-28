#################################################################################################################
# REQUIRED VARIABLES
#################################################################################################################
variable "resource_group_name" {
  type        = string
  description = "The name of the Azure resource group in which resources will be deployed."
}

variable "resource_group_location" {
  type        = string
  description = "The Azure region where the resource group will be created."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the virtual machine will be deployed."
}

variable "network_interface_name" {
  type        = string
  description = "The name of the network interface to associate with the virtual machine."
}

variable "ip_configuration_name" {
  type        = string
  description = "The name of the IP configuration for the network interface."
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine instance."
}

variable "storage_os_disk_name" {
  type        = string
  description = "The name assigned to the OS disk."
}

variable "os_profile_computer_name" {
  type        = string
  description = "The hostname of the virtual machine."
}

variable "public_ip_name" {
  type        = string
  description = "The name of the public IP resource associated with the VM."
}

variable "os_profile_admin_username" {
  type        = string
  description = "The administrator username for the virtual machine."
}

variable "os_profile_admin_public_key" {
  type        = string
  description = "The administrator public key value."
}

variable "network_security_group_id" {
  type        = string
  description = "ID of network security group"
}

#################################################################################################################
# OPTIONAL VARIABLES
#################################################################################################################
variable "vm_size" {
  type        = string
  description = "Specifies the size of the virtual machine."
  default     = "Standard_B4ms"
}

variable "storage_image_reference_publisher" {
  type        = string
  description = "The publisher of the image used for the virtual machine's OS."
  default     = "Canonical"
}

variable "storage_image_reference_offer" {
  type        = string
  description = "The offer of the platform image or marketplace image."
  default     = "0001-com-ubuntu-server-jammy"
}

variable "storage_image_reference_sku" {
  type        = string
  description = "The SKU (Stock Keeping Unit) of the selected image."
  default     = "22_04-lts-gen2"
}

variable "storage_image_reference_version" {
  type        = string
  description = "The version of the selected image. Use 'latest' for the most recent version."
  default     = "latest"
}

variable "storage_os_disk_caching" {
  type        = string
  description = "Defines the caching policy for the OS disk (e.g., ReadOnly, ReadWrite)."
  default     = "ReadWrite"
}

variable "storage_os_disk_create_option" {
  type        = string
  description = "Determines how the OS disk should be created (e.g., FromImage, Attach, Empty)."
  default     = "FromImage"
}

variable "storage_os_disk_managed_disk_type" {
  type        = string
  description = "Defines the type of managed disk for the OS disk (e.g., Premium_LRS, Standard_LRS)."
  default     = "Premium_LRS"
}

variable "tags" {
  type        = map(string)
  description = "Tags for all resources"
  default = {
    Environment  = "DEV"
    Owner        = "Terraform"
    Autoshutdown = "OFF"
  }
}
