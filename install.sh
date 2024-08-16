#!/bin/sh

# This script should ask users what they would like to use for C2 servers etc...
ansible-galaxy collection install cloud.terraform
terraform init
terraform apply
terraform output -raw table | less
ansible-playbook -i inventory.yml -u ubuntu ansible/main.yml
