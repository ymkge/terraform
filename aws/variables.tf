variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-1" # 東京リージョンをデフォルトに設定
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "my-terraform-ec2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro" # t2.microをデフォルトに設定
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
  # Amazon Linux 2023 (x86_64) のAMI ID。リージョンによって異なるため、適宜変更してください。
  default = "ami-0c7f4b8ed41088663" 
}