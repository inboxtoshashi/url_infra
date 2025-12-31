output "public_ip" {
  value = aws_instance.public_ec2.public_ip
}

output "app_name" {
  value = var.tags["App"]
}
