# Create instance
resource "aws_instance" "short_c2" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.short_c2.id]
  subnet_id                   = aws_subnet.private_subnet.id
  associate_public_ip_address = true
  key_name                    = "ansible"

  tags = {
    Name = "Short C2"
  }
}

# Create security group
resource "aws_security_group" "short_c2" {
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
}

# Ansible config & vars
resource "ansible_host" "short_c2" {
  name   = aws_instance.short_c2.private_ip
  groups = ["sliver"] # TODO: Make this a variable
  variables = {
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no -o ProxyCommand='ssh -W %h:%p -i ./keys/ansible ubuntu@${aws_instance.vpn.public_ip}'",
    hostname                = "short-c2-server"
  }
}
