# EC2 Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "task-ec2-sg"
  description = "Allow SSH from my IP"
  vpc_id      = aws_vpc.main.id

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
}

# EC2 Instance
resource "aws_instance" "web" {
  ami                    = "ami-052064a798f08f0d3" # Ubuntu 22.04 LTS (update for your region)
  instance_type          = var.ec2_instance_type
  subnet_id              = aws_subnet.public[0].id
  key_name               = var.ec2_key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "Web-EC2"
  }
}
