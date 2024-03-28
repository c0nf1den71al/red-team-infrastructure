# red-team-infrastructure

1. Create SSH keys for Ansible:
```sh
ssh-keygen -f ./keys/ansible
```

2. Install ansible and initialise AWS CLI

3. Install required ansible plugins:
```
ansible-galaxy collection install cloud.terraform
```
   
5. Create `terraform.tfvars` and insert vars. For example:
```
# Ansible SSH keys
ansible_public_key  = "keys/ansible.pub"
ansible_private_key = "./keys/ansible"

# Tailscale Auth Key for VPN
tailscale_auth_key = "tskey-auth-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

6. Spin up infrastructure
```sh
terraform init
terraform apply
```

7. Run Ansible
```sh
ansible-playbook -i inventory.yml -u ubuntu ansible/main.yml
```
