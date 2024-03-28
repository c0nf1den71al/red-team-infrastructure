# red-team-infrastructure

Create `terraform.tfvars` and insert vars. For example:

```
# Ansible SSH keys
ansible_public_key  = "keys/ansible.pub"
ansible_private_key = "./keys/ansible"

# Tailscale Auth Key for VPN
tailscale_auth_key = "tskey-auth-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
```
