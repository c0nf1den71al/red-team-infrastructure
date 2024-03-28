terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6.0"
    }
    ansible = {
      source  = "ansible/ansible"
      version = "1.2.0"
    }
  }
}

# If you get an error about profile, make sure AWS CLI is installed and configured
provider "aws" {
  profile = var.aws_profile
  region  = "us-east-2"
}

# Grab the latest Ubuntu image
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"] # Canonical
}

# SSH Keys
resource "aws_key_pair" "ansible" {
  key_name   = "ansible"
  public_key = file(var.ansible_public_key)
}

# Global Ansible config and vars
resource "ansible_group" "all" {
  name = "all"
  variables = {
    ansible_user                 = "ubuntu",
    ansible_ssh_private_key_file = var.ansible_private_key,
    elastic_password             = random_password.elastic_password.result,
    logstash_password            = random_password.logstash_password.result,
    kibana_password              = random_password.kibana_password.result,
    filebeat_password            = random_password.filebeat_password.result,
    metricbeat_password          = random_password.metricbeat_password.result,
    elk_host                     = aws_instance.elk.private_ip
  }
}
