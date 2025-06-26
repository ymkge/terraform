variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "ap-northeast-1" # 東京リージョン
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "my-terraform-ec2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

# AMI IDの代わりに、フィルタリング条件を定義
variable "ami_owner" {
  description = "Owner of the AMI (e.g., 'amazon' for Amazon-provided AMIs)"
  type        = string
  default     = "amazon"
}

variable "ami_filter_name" {
  description = "Name filter for the AMI"
  type        = string
  default     = "al2023-ami-minimal-*-x86_64" # Amazon Linux 2023の最新AMIを取得するためのパターン
}