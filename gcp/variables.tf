variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "region" {
  description = "GCP Region"
  type        = string
  default     = "asia-northeast1" # 東京リージョンをデフォルトに設定
}

variable "zone" {
  description = "GCP Zone"
  type        = string
  type        = string
  default     = "asia-northeast1-a" # 東京リージョンのAゾーンをデフォルトに設定
}

variable "instance_name" {
  description = "VM instance name"
  type        = string
  default     = "my-terraform-vm"
}

variable "machine_type" {
  description = "Machine type for the VM instance"
  type        = string
  default     = "e2-medium" # e2-mediumをデフォルトに設定
}

variable "image" {
  description = "Disk image for the VM instance"
  type        = string
  default     = "debian-cloud/debian-11" # Debian 11をデフォルトに設定
}

variable "network_name" {
  description = "VPC network name"
  type        = string
  default     = "default" # デフォルトVPCネットワークを使用
}