output "web_server_arn" {
  value = module.ec2_instance.arn
}

output "public_ip_of_the_web_server" {
  value = module.ec2_instance.public_ip
}

output "web_servers_sg_id" {
  value = aws_security_group.web-server-sg.id
}