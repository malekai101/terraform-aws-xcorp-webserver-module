data aws_ami "linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  owners = ["amazon"]
}

resource "aws_lb" "application_lb" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = []
  subnets            = var.subnet_id

  enable_deletion_protection = true

  tags = {
    Environment = "production"
  }
}

resource "aws_instance" "application" {
  ami                         = data.aws_ami.linux_ami.id
  instance_type               = "t2.micro"
  count = 3
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = []
  associate_public_ip_address = false

  tags = {
    Project = var.project_name
    Name    = "App Server"
  }
}


