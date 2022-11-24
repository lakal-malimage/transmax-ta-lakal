resource "aws_security_group" "web-server-sg" {
  name        = "web-servers-sg"
  description = "This SG controls the connections to web-servers"
  vpc_id      = var.vpc_id

  ingress = [
    {
      description      = "private_subnets_in"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    },
    {
      description      = "private_subnets_in"
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  egress = [
    { description = "default egress"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }
  ]

  tags = {
    Name = "${var.environment}_web_servers_sg"
  }
}

#data "aws_subnets" "subnet_ids" {
#  filter {
#    name   = "vpc-id"
#    values = [var.vpc_id]
#  }
#}


data "aws_region" "current" {}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.2.1"

  name = var.instance_name

  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  associate_public_ip_address = true
  monitoring             = false
  vpc_security_group_ids = [aws_security_group.web-server-sg.id]
  subnet_id              = var.web_server_subnet_id
  #iam_instance_profile = var.iam_instance_profile_name
  root_block_device = [
        {
            volume_type = "gp3"
            volume_size = var.root_disk_size_gb
            encrypted   = false
        }
    ]
  tags = {
  }
}