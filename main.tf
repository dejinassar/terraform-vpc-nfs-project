terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_key_pair" "terraform_key" {
  key_name   = "terraform-key"
  public_key = file("${path.module}/ssh-key/terraform-key.pub")
}

module "vpc" {
  source              = "./modules/vpc"
  vpc_cidr            = "10.0.0.0/16"
  public_subnet_cidr  = "10.0.1.0/24"
  availability_zone   = "us-east-1a"
  vpc_name            = "terraform-vpc"
}

module "security_group" {
  source       = "./modules/security"
  vpc_id       = module.vpc.vpc_id
  sg_name      = "public-sg"
  sg_description = "Allow SSH and HTTP access"
}

module "web_server" {
  source           = "./modules/compute"
  ami              = "ami-0c02fb55956c7d316"
  instance_type    = "t3.micro"
  subnet_id        = module.vpc.public_subnet_id
  security_group_id = module.security_group.security_group_id
  key_name         = aws_key_pair.terraform_key.key_name
  instance_name    = "terraform-web-server"
}

