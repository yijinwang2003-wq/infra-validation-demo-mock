provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Security group for infra validation demo"

  ingress {
    description = "Allow HTTP from internal network only"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    description = "Restrict outbound traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }
}