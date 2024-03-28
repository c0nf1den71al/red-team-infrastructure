variable "ansible_public_key" {
  type = string
}

variable "ansible_private_key" {
  type      = string
  sensitive = true
}

variable "tailscale_auth_key" {
  type      = string
  sensitive = true
}

variable "aws_profile" {
  type    = string
  default = "terraform"
}

variable "short_c2_forward_domain" {
  type = string
}

variable "short_c2_redirect_path" {
  type = string
}
