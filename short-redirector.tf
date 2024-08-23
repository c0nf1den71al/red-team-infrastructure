# Create instance
resource "aws_instance" "short_redirector" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.short_redirector.id]
  subnet_id                   = aws_subnet.public_subnet.id
  associate_public_ip_address = true
  key_name                    = "ansible"

  tags = {
    Name = "Short C2 Redirector"
  }
}

# Create security group
resource "aws_security_group" "short_redirector" {
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
      cidr_blocks      = [aws_subnet.public_subnet.cidr_block, aws_subnet.private_subnet.cidr_block, ]
      description      = "Allow inbound from hosts within the VPC"
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "Inbound HTTP"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks      = ["0.0.0.0/0", ]
      description      = "Inbound HTTPS"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    }
  ]
}

# Ansible config & vars
resource "ansible_host" "short_redirector" {
  name   = aws_instance.short_redirector.private_ip
  groups = ["nginx"]
  variables = {
    ansible_ssh_common_args = "-o ProxyJump=ubuntu@${aws_instance.vpn.public_ip} -o ForwardAgent=yes",
    hostname                = "short-c2-redirector",
    ansible_user            = "ubuntu"
    public_ip               = aws_instance.short_redirector.public_ip,
    c2_server_ip            = aws_instance.short_c2.private_ip,
    forward_domain          = var.short_c2_forward_domain,
    redirect_path           = var.short_c2_redirect_path
  }
}
