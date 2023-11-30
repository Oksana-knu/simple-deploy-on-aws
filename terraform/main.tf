terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.28.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region     = "eu-central-1"
}

resource "awslightsail_container_service" "test" {
  name        = "container-service-1"
  power       = "nano"
  scale       = 1
  is_disabled = false
  tags = {
    foo1 = "bar1"
    foo2 = ""
  }
}

resource "awslightsail_container_deployment" "test" {
  container_service_name = awslightsail_container_service.test.id
  container {
    container_name = "test1"
    image          = "amazon/amazon-lightsail:hello-world"
    port {
      port_number = 80
      protocol    = "HTTP"
    }
  }
  public_endpoint {
    container_name = "test1"
    container_port = 80

    health_check {
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout_seconds     = 2
      interval_seconds    = 5
      path                = "/"
      success_codes       = "200-499"
    }
  }

  service_name = aws_lightsail_container_service.test.name
}
