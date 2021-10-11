terraform {
  backend "remote" {
    organization = "skuczynska-organization"
    workspaces {
      name = "Example-Workspace"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
}

resource "aws_instance" "skuczynska-app-server" {
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t3.micro"

  tags = {
    Owner = "skuczynska"
    Name = var.instance_name
  }
}
