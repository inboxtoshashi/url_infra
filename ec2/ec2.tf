resource "aws_instance" "public_ec2" {
  instance_type          = var.type
  name                   = "url_app"
  ami                    = var.ami
  key_name               = var.ssh_key
  iam_instance_profile   = var.iam_instance_profile_name
  subnet_id              = var.public_subnet_id
  vpc_security_group_ids = [var.vpc_security_group_ids]
  tags = {
    Name = "url_application"
  }
  provisioner "remote-exec" {
    connection {
      type = "ssh"
      user = "ubuntu"
      //Creating a new key pair
      private_key = file("url_app.pem")
      host        = self.public_ip
      timeout     = "1m"
      agent       = false
    }
  }
}

variable "iam_instance_profile_name" {
  type        = string
  description = "IAM instance profile name for EC2"
}
