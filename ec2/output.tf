output "public_ip" {
  value = aws_instance.public_ec2.ec2_public_ip
}
