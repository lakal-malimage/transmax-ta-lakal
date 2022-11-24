module "vpc" {
  source                 = "../../modules/vpc"
  environment            = var.environment
  vpc_name               = var.vpc_name
  vpc_cidr_block         = var.vpc_cidr_block
  azs = var.vpc_availability_zones
  private_subnets    = var.vpc_private_subnets
  public_subnets     = var.vpc_public_subnets

}

resource "tls_private_key" "ec2_tls_pvt_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_tls_pvt_key.public_key_openssh
}

data "local_file" "web_server_user_data" {
  filename = "${path.module}/userdata/web_server_user_data.sh"
}

module "ec2-web" {
  source                 = "../../modules/ec2-web"
  vpc_id = module.vpc.vpc_id
  environment = "dev"
  instance_name = var.instance_name
  ami_id = var.ami_id
  instance_type = var.instance_type
  key_name = aws_key_pair.generated_ec2_key.key_name
  web_server_subnet_id = element(module.vpc.public_subnets,0)
  root_disk_size_gb = var.root_disk_size_gb
  user_data = data.local_file.web_server_user_data.content

}

