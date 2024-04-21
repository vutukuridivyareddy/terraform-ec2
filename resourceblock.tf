resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg-1"
  description = "terraform-ec2-sg"
  

  # vpc_id = "vpc-12345678" Replace with your VPC ID

  // Define ingress rules (inbound traffic)
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow traffic from all sources (for demonstration)
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow SSH traffic from all sources (for demonstration)
  }

  // Define egress rules (outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic (for demonstration)
  }
}


resource "aws_instance" "ec2" {
    ami = "ami-07d9b9ddc6cd8dd30"
    instance_type = "t2.micro"
    key_name = "security"
    subnet_id = "subnet-093c04d40cd777b27"
    security_groups = [aws_security_group.ec2_sg.id]
    tags = {
        Name = "terraform-ec2-1"
    }
}

