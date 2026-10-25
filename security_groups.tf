

resource "aws_security_group" "public_sg" {
  name        = "public-ec2-sg"
  description = "Security group for public EC2 instance"
  vpc_id      = aws_vpc.portfolio_vpc.id

  tags = {
    Name = "Public-EC2-SG"
  }
}


resource "aws_vpc_security_group_ingress_rule" "public_ssh" {
  security_group_id = aws_security_group.public_sg.id

  description = "Allow SSH from trusted IP"
  from_port   = 22
  to_port     = 22
  ip_protocol = "tcp"

  cidr_ipv4 = var.my_ip
}


resource "aws_security_group" "private_sg" {
  name        = "private-ec2-sg"
  description = "Security group for private EC2 instance"
  vpc_id      = aws_vpc.portfolio_vpc.id

  tags = {
    Name = "Private-EC2-SG"
  }
}


resource "aws_vpc_security_group_ingress_rule" "private_ssh" {
  security_group_id = aws_security_group.private_sg.id

  description                  = "Allow SSH from public EC2 security group"
  from_port                    = 22
  to_port                      = 22
  ip_protocol                  = "tcp"
  referenced_security_group_id = aws_security_group.public_sg.id
}


resource "aws_vpc_security_group_egress_rule" "public_outbound" {
  security_group_id = aws_security_group.public_sg.id

  description = "Allow outbound IPv4 traffic"
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "private_outbound" {
  security_group_id = aws_security_group.private_sg.id

  description = "Allow outbound IPv4 traffic"
  ip_protocol = "-1"
  cidr_ipv4   = "0.0.0.0/0"
}


