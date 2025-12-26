resource "aws_instance" "public_ec2" {
  instance_type          = var.type
  ami                    = var.ami_id
  key_name               = var.ssh_key
  iam_instance_profile   = var.iam_instance_profile
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  tags                   = merge(var.tags, { Name = var.name })
}