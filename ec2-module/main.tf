data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }

  filter {
    name   = "virtualization_type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "ec2" {
  ami           = var.ami != "" ? var.ami : data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  hdd_device {
    volume_size = var.disk_size
    volume_type = var.disk_type
  }

  tags = {
    Name = var.instance_name
  }
}

resource "aws_security_group" "sg" {
  name        = var.security_group_name

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      description = ingress.value.description
      cidr_blocks = [ingress.value.cidr_blocks]
    }
  }
  tags = {
    Name = var.security_group_name
  }
}