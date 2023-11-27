terraform {
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region     = "eu-central-1"
}

resource "aws_instance" "webapp_instance" {
  ami           = "ami-0669b163befffbdfc"
  instance_type = "t2.micro"
  security_groups= ["group-aws-deploy"]
  tags = {
    Name = "webapp_instance"
  }
}
