data "aws_region" "current_region" {}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.18.1"

  name = var.vpc_name
  cidr = var.vpc_cidr_block

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  private_subnet_tags = {
    type = "private"
  }
  public_subnet_tags = {
    type = "public"
  }

  enable_nat_gateway = true
  enable_vpn_gateway = false

  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {

  }

}

