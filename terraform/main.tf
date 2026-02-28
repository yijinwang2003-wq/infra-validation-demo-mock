provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "demo_sg" {
  name        = "demo_sg"
  description = "Security group for infra validation demo"
  ingress {
    description = "Allow HTTP only"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}