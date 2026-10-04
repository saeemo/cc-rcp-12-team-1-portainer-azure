output "public_ip_address" {
  value = azurerm_public_ip.pip.ip_address
}

output "ssh_command" {
  value = "ssh -i ~/.ssh/id_rsa ${var.admin_username}@${azurerm_public_ip.pip.ip_address}"
}

output "portainer_url" {
  value = "https://${azurerm_public_ip.pip.ip_address}:9443"
}
