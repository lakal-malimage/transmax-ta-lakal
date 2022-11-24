output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2-web-arn" {
  value = module.ec2-web.web_server_arn
}

output "ec2-web-public_ip" {
  value = module.ec2-web.public_ip_of_the_web_server
}