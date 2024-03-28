#!/bin/sh

# ansible-galaxy collection install cloud.terraform
terraform init
terraform apply
terraform output -raw table | less
ansible-playbook -i inventory.yml -u ubuntu ansible/main.yml
