
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "public_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.portfolio_key.key_name

  subnet_id = aws_subnet.public_subnet.id

  vpc_security_group_ids = [
    aws_security_group.public_sg.id
  ]

  associate_public_ip_address = true

  tags = {
    Name    = "Portfolio-Public-EC2"
    Project = "AWS-Terraform-Portfolio"
  }
}


resource "aws_instance" "private_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.portfolio_key.key_name

  subnet_id = aws_subnet.private_subnet.id

  vpc_security_group_ids = [
    aws_security_group.private_sg.id
  ]

  associate_public_ip_address = false

  tags = {
    Name    = "Portfolio-Private-EC2"
    Project = "AWS-Terraform-Portfolio"
  }
}
