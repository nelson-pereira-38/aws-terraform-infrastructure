resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.portfolio_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "Portfolio-Public-Subnet"
    Project = "AWS-Terraform-Portfolio"
  }
}


resource "aws_subnet" "private_subnet" {
  vpc_id                  = aws_vpc.portfolio_vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false

  tags = {
    Name    = "Portfolio-Private-Subnet"
    Project = "AWS-Terraform-Portfolio"
  }
}


