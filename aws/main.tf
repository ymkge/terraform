provider "aws" {
  region = var.aws_region
}

# セキュリティグループ（GCPのファイアウォールルールに相当）を定義
resource "aws_security_group" "web_sg" {
  name        = "${var.instance_name}-sg"
  description = "Allow HTTP and SSH access"

  # インバウンドルール：HTTP (ポート80) を許可
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # インバウンドルール：SSH (ポート22) を許可
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # アウトバウンドルール：すべてのトラフィックを許可
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # -1は全てのプロトコルを意味
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

# EC2インスタンスを定義
resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = var.instance_type
  # 作成したセキュリティグループをアタッチ
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # 起動時に実行されるシェルスクリプト
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y httpd
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