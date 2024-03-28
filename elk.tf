# Create instance
resource "aws_instance" "elk" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t3a.medium"
  vpc_security_group_ids      = [aws_security_group.elk.id]
  subnet_id                   = aws_subnet.private_subnet.id
  associate_public_ip_address = false
  key_name                    = "ansible"

  tags = {
    Name = "Elastic Stack"
  }
}

# Create security group
resource "aws_security_group" "elk" {
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

# ELK credentials
resource "random_password" "elastic_password" {
  length  = 32
  special = false
}

resource "random_password" "logstash_password" {
  length  = 32
  special = false
}

resource "random_password" "kibana_password" {
  length  = 32
  special = false
}

resource "random_password" "metricbeat_password" {
  length  = 32
  special = false
}

resource "random_password" "filebeat_password" {
  length  = 32
  special = false
}

# Ansible config & vars
resource "ansible_host" "elk" {
  name   = aws_instance.elk.private_ip
  groups = ["docker", "elk"]
  variables = {
    ansible_ssh_common_args = "-o StrictHostKeyChecking=no -o ProxyCommand='ssh -W %h:%p -i ./keys/ansible ubuntu@${aws_instance.vpn.public_ip}'",
    hostname                = "elk-stack-server"
  }
}
