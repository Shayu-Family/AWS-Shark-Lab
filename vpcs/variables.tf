#region Main-VPC

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

# Public subnet

variable "public_subnet_name" {
  description = "The CIDR block for public subnet"
  type        = string
}

variable "public_subnet_cidr" {
  description = "Name of the public subnet"
  type        = string
}


variable "public_az" {
  description = "The Availability Zone of the public subnet"
  type        = string
}

# Private subnet

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
}

variable "private_az" {
  description = "The Availability Zone of the private subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "The CIDR block for private subnet"
  type        = string
}

variable "public_igw_name" {
  description = "Name of the internet gateway for public subnet"
  type        = string
}

#endregion