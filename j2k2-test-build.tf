# Author Jamie McKay

# Script Goals - Build a 2 Tier Environment (web/app, Data). Load Balanced Web front end (basic HTML which reads data in a DB (simple String)) using ELB. 
# Web servers deployed across AZs in Ireland. mySQL DB using RDS.
# This script will build the infra and Ansible will create the HTML

# This script is stored in GitHub - git@github.com:d3adv3gas/aws-test.git

# Setup the Provider - Variable provied by file
provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

# Create an Ubuntu Bastion Server
resource "aws_instance" "j2k2-test-build" {
  ami           = "ami-785db401" # Machine Version
  instance_type = "t2.micro" # Instance Type
  subnet_id     = "subnet-faf02fa1" # Add to this subnet
  key_name      = "j2k2lablinux" # Use this key
  security_groups = ["sg-1f8df464"] # Add to the Bastion Security Group
  associate_public_ip_address = "true" # Add a Public IP
}


