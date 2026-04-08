# output "ubuntu_vm_key_auth_ssh_command" {
#   value = "ssh razumovsky_r@${module.ubuntu_vm_key_auth.public_ip}"
# }

output "ubuntu_vm_custom_image_key_auth_ssh_command" {
  value = "ssh razumovsky_r@${module.ubuntu_vm_custom_image_key_auth.public_ip}"
}

# output "ubuntu_vm_pass_auth_ssh_command" {
#   value = "ssh razumovsky_r@${module.ubuntu_vm_pass_auth.public_ip}"
# }

# output "ubuntu_vm_pass_auth_custom_image_ssh_command" {
#   value = "ssh razumovsky_r@${module.ubuntu_vm_pass_auth_custom_image.public_ip}"
# }
