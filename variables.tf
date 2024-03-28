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
