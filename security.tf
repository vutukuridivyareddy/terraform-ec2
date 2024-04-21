resource "aws_security_group" "ec2_sg" {
    name = "My_ec2_sg"
    description = "sg for ec2"
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 22
        to_port = 22
        protocol = "tcp"
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 80
        to_port = 80
        protocol = "tcp"
    }

    egress {
        cidr_blocks = [ "0.0.0.0/0" ]
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
  
}
