terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.58.0"
    }
  }
}



# Configuration options
provider "aws" {
  region     = "ap-south-1"
  access_key = var.access_key
  secret_key = var.secret_key

}

// Calling EC2 Module

module "ec2_module" {
  source                 = "./modules/ec2_instance"
  ami_id                 = var.ami_id
  instance_type          = var.instance_type
  tag                    = var.tag
  key                    = file("${path.module}/rraform.pub")
  key_name               = var.key_name
  ports                  = var.ports
  SG_tag                 = var.SG_tag
  # vpc_security_group_ids = [aws_security_group.SG.id]
  # subnet_id     = aws_subnet.subnet_test.id
}

