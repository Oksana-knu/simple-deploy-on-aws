terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS provider
provider "aws" {
  region     = "eu-central-1"
}

resource "aws_lightsail_container_service" "flask_application" {
  name = "flask-application"
  power = "nano"
  scale = 1
  tags = {
    version = "1.0.0"
  }
}

resource "aws_lightsail_container_service_deployment_version" "flask_app_deployment" {
  container {
    container_name = "flask-application"

    image = "myimage:latest"
    
    ports = {
      # Consistent with the port exposed by the Dockerfile and app.py
      5000 = "HTTP"
    }
  }

  public_endpoint {
    container_name = "flask-application"
    # Consistent with the port exposed by the Dockerfile and app.py
    container_port = 5000

    health_check {
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout_seconds     = 2
      interval_seconds    = 5
      path                = "/"
      success_codes       = "200-499"
    }
  }

  service_name = aws_lightsail_container_service.flask_application.name
}
