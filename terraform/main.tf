provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Security group for infra validation demo"

  ingress {
    description = "SSH from anywhere (intentionally insecure for demo)"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # <-- 漏洞点：tfsec 必抓
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}