resource "aws_vpc" "main_vpc" {
  cidr_block       = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id              = aws_vpc.main_vpc.id
  cidr_block          = var.public_subnet_cidr
  availability_zone   = var.public_az
  tags = {
    Name = var.public_subnet_name
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id              = aws_vpc.main_vpc.id
  cidr_block          = var.private_subnet_cidr
  availability_zone   = var.private_az
  tags = {
    Name = var.private_subnet_name
  }
}
