# VPC Variables
variable "environment" {
  default = "dev"
}

variable "vpc_name" {
  default = "transmax-dev-vpc"
}

variable "vpc_cidr_block" {
  default = "10.1.0.0/16"
}

variable "vpc_availability_zones" {
  default = ["us-east-1a"]
  type = list(string)
}

variable "vpc_private_subnets" {
  default = ["10.1.1.0/24"]
  type = list(string)
}
variable "vpc_public_subnets" {
  default = ["10.1.2.0/24"]
  type = list(string)
}


# Ec2-Web Variables

variable "instance_name" {
  default = "transmax-dev-web-01"
}

variable "ami_id" {
  default = "ami-0b0dcb5067f052a63"
}

variable "instance_type" {
  default = "t3.micro"
}


variable "root_disk_size_gb" {
  default = "20"
  type = number
}

# keys

variable "key_name" {
  default = "dev_key"
}