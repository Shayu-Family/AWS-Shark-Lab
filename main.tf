provider "aws" {
  region = "ap-southeast-1"
}

module "vpcs" {
  source = "./vpcs"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
  public_subnet_name = var.public_subnet_name
  public_subnet_cidr = var.public_subnet_cidr
  public_az = var.public_az
  private_subnet_name = var.private_subnet_name
  private_az = var.private_az
  private_subnet_cidr = var.private_subnet_cidr
  public_igw_name = var.public_igw_name
}

module "security_groups" {
  source = "./security_groups"
  wireguard_router_sg_name = var.wireguard_router_sg_name
  tooling_vm_sg_name = var.tooling_vm_sg_name
}

module "computes" {
  source = "./computes"
  wireguard_router_ec2_name = var.wireguard_router_ec2_name
  tooling_vm_ec2_name = var.tooling_vm_ec2_name
}