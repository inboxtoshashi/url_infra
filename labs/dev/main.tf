data "aws_ssm_parameter" "parameter" {
  name = var.ami_ssm_path
}

module "ec2_resource" {
  source                    = "../../ec2"
  ami_id                    = data.aws_ssm_parameter.parameter.value
  public_subnet_id          = module.subnet_resource.public_subnet_id_result
  iam_instance_profile      = module.roles.instance_profile_name
  vpc_security_group_ids    = [module.security_group_resource.sg_id_result]
  tags                      = var.tags
  name                      = var.name
}

module "aws_internet_gateway" {
  source = "../../igw"
  //passsing vpc_id to igw.tf to attach the vpc with internet_gateway
  vpc_id = module.vpc_resource.vpc_id_result
  tags   = var.tags
}

module "roles" {
  source                    = "../../roles"
}

module "route_table_resource" {
  source           = "../../rtb"
  vpc_id           = module.vpc_resource.vpc_id_result
  gateway_id       = module.aws_internet_gateway.igw_id_result
  public_subnet_id = module.subnet_resource.public_subnet_id_result
  env              = var.env
  tags             = var.tags
}

module "security_group_resource" {
  source = "../../sg"
  //passsing vpc_id to sg.tf to attache the vpc with security_group
  vpc_id = module.vpc_resource.vpc_id_result
  env    = var.env
  tags   = var.tags
}

module "subnet_resource" {
  source            = "../../subnet"
  vpc_id            = module.vpc_resource.vpc_id_result
  availability_zone = var.availability_zone
  env               = var.env
  tags              = var.tags
}

module "vpc_resource" {
  source   = "../../vpc"
  vpc_name = var.vpc_name
  vpc_cidr = var.vpc_cidr
  env      = var.env
  tags     = var.tags
}

# Outputs
output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = module.ec2_resource.public_ip
}
