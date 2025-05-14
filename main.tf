provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "parameter" {
  name = "/base/ami"
}

module "ec2_resource" {
  source                    = "./ec2"
  ami                       = data.aws_ssm_parameter.parameter.value
  public_subnet_id          = module.subnet_resource.public_subnet_id_result
  iam_instance_profile      = module.roles.instance_profile_name
  vpc_security_group_ids    = module.security_group_resource.sg_id_result
}

module "aws_internet_gateway" {
  source = "./igw"
  //passsing vpc_id to igw.tf to attach the vpc with internet_gateway
  vpc_id = module.vpc_resource.vpc_id_result
}

module "roles" {
  source                    = "./roles"
  ssm_parameter_name        = "/jenkins/secret"
  region                    = "us-east-1"
  iam_role_name             = "jenkins_ec2_role"
  iam_instance_profile_name = "jenkins_ec2_profile"
}

module "route_table_resource" {
  source           = "./rtb"
  vpc_id           = module.vpc_resource.vpc_id_result
  gateway_id       = module.aws_internet_gateway.igw_id_result
  public_subnet_id = module.subnet_resource.public_subnet_id_result
}

module "security_group_resource" {
  source = "./sg"
  //passsing vpc_id to sg.tf to attache the vpc with security_group
  vpc_id = module.vpc_resource.vpc_id_result
}

module "subnet_resource" {
  source = "./subnet"
  vpc_id = module.vpc_resource.vpc_id_result
}

module "vpc_resource" {
  source = "./vpc"
}