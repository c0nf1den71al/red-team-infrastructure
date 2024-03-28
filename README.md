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
# AWS Configuration
aws_profile = "terraform"

# Ansible SSH keys
ansible_public_key  = "keys/ansible.pub"
ansible_private_key = "./keys/ansible"

# Tailscale Auth Key for VPN
tailscale_auth_key = "tskey-auth-xxxxxxxxxx-xxxxxxxxxxxxxxxxxxx"

# Short C2 Configuration
short_c2_forward_domain = "http://example.com"
short_c2_redirect_path  = "/assets/en-gb/"

```

5. Spin up infrastructure

```sh
terraform init
terraform apply
```

6. View final config and credentials:

```sh
terraform output -raw table
```

7. Run Ansible

```sh
ansible-playbook -i inventory.yml -u ubuntu ansible/main.yml
```
