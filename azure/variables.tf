variable "resource_group_location" {
  description = "Location of the resource group."
  type        = string
  default     = "japaneast" # 東京（東日本）
}

variable "resource_group_name_prefix" {
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
  type        = string
  default     = "rg"
}

variable "vm_size" {
  description = "Size of the Virtual Machine."
  type        = string
  default     = "Standard_B1s" # コスト効率の良いサイズ
}

variable "admin_username" {
  description = "Username for the Virtual Machine."
  type        = string
  default     = "azureuser"
}
