output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_resource.public_ip
}

output "app_name" {
  description = "Application name from tags"
  value       = module.ec2_resource.app_name
}
