# red-team-infrastructure

1. Create SSH keys for Ansible:

```sh
mkdir keys
ssh-keygen -f ./keys/ansible
```

2. Install ansible and initialise AWS CLI

3. Install required ansible plugins:

```
ansible-galaxy collection install cloud.terraform
```

4. Create `terraform.tfvars` and insert vars. For example:

```
# AWS Config
aws_profile = "terraform"

# Ansible SSH keys
ansible_public_key  = "keys/ansible.pub"
ansible_private_key = "./keys/ansible"

# Tailscale Auth Key for VPN
tailscale_auth_key = "tskey-auth-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

5. Spin up infrastructure

```sh
terraform init
terraform apply
```

6. Run Ansible

```sh
ansible-playbook -i inventory.yml -u ubuntu ansible/main.yml
```
