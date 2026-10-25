
resource "aws_key_pair" "portfolio_key" {
  key_name   = "aws-portfolio-key"
  public_key = file(pathexpand("~/.ssh/aws-portfolio.pub"))

  tags = {
    Name    = "Portfolio-SSH-Key"
    Project = "AWS-Terraform-Portfolio"
  }
}
