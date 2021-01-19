data aws_ami "linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_security_group" "allow_web" {
  description = "Allow web traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "Incoming Web"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Incoming Secure Web"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "application" {
  ami                         = data.aws_ami.linux_ami.id
  instance_type               = "t2.micro"
  count = var.server_count
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [
    aws_security_group.allow_web.id,
    var.ssh_group_id
  ]
  key_name                    = var.key
  associate_public_ip_address = true

  lifecycle {
    ignore_changes = [
      ami,
    ]
  }

  tags = {
    Project = var.project_name
    Name    = "App Server ${count.index}"
  }
}


