
provider "aws" {
  region = "eu-west-1"  # Uses this as a default region to deploy resources
  version = "~> 2.50"   # Freezing AWS Provider version is a good practice in case next one breaks something
}

# Create EC2 instance in DEFAULT VPC
resource "aws_instance" "test-shehr" {
  ami                    = "ami-009bdfd61d16a1793"
  count                  = "1"
  key_name               = "padlock1"
  vpc_security_group_ids = [aws_security_group.default.id]
  source_dest_check      = false
  instance_type          = "t3.small"

  tags = {
    Name = "tf-default-shehr"
  }
}

# Create Security Group for EC2
resource "aws_security_group" "default" {
  name = "tf-default-shehr-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
