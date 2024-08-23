# Create instance
resource "aws_instance" "vpn" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.vpn.id]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = "ansible"

  tags = {
    Name = "VPN"
  }
}

# Create security group
resource "aws_security_group" "vpn" {
  vpc_id = aws_vpc.main.id
  egress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress = [
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "SSH for Ansible"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "Wireguard VPN"
      from_port        = 51820
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "udp"
      security_groups  = []
      self             = false
      to_port          = 51820
    }
  ]
}

# Ansible config & vars
resource "ansible_host" "vpn" {
  name   = aws_instance.vpn.public_ip
  groups = ["vpn"]
  variables = {
    private_subnet          = aws_subnet.private_subnet.cidr_block,
    tailscale_auth_key      = var.tailscale_auth_key,
    ansible_user            = "ubuntu"
    hostname                = "vpn-server"
  }
}
