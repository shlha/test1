
# Create EC2 instance
resource "aws_instance" "test-shehr" {
  ami                    = "ami-021acbdb89706aa89"
  count                  = "1"
  key_name               = "padlock1"
  vpc_security_group_ids = "${aws_security_group.default.id}"
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

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["81.108.106.54/32"]
  }
