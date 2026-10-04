variable "project_name" {
  type    = string
  default = "portainer-project"
}

variable "resource_group_name" {
  type    = string
  default = "portainer-rg"
}

variable "location" {
  type    = string
  default = "australiaeast"
}

variable "vm_name" {
  type    = string
  default = "portainer-vm"
}

variable "vm_size" {
  type    = string
  default = "Standard_B2ats_v2"
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}

variable "source_ssh_allowed" {
  type    = string
  default = "*"
}