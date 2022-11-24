output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2-web-arn" {
  value = module.ec2-web.web_server_arn
}

output "ec2-web-public_ip" {
  value = module.ec2-web.public_ip_of_the_web_server
}

output "ec2_key" {
  value = nonsensitive(tls_private_key.ec2_tls_pvt_key.private_key_pem)
  sensitive = true
}