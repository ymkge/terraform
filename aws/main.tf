provider "aws" {
  region = var.aws_region
}

# --- AMI IDを動的に取得するデータソースを追加 ---
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = [var.ami_filter_name]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# --- セキュリティグループ（変更なし、最新の状態） ---
resource "aws_security_group" "web_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow HTTP and SSH access"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

# --- EC2インスタンスを定義（AMIを動的に参照するように更新） ---
resource "aws_instance" "web_server" {
  # AMIをハードコードする代わりにデータソースのIDを参照
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instance_type
  
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # 起動時に実行されるシェルスクリプト
  user_data = <<-EOF
    #!/bin/bash
    sudo dnf update -y
    sudo dnf install -y httpd
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "Hello from Terraform on EC2!" > /var/www/html/index.html
  EOF

  tags = {
    Name = var.instance_name
  }
}

# 作成したインスタンスのパブリックIPアドレスを出力
output "public_ip" {
  value = aws_instance.web_server.public_ip
}