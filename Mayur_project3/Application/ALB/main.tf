data "aws_subnet" "ec2_subnet" {
  id = var.ec2_subnet_id
}

data "aws_subnets" "all" {
  filter {
    name   = "vpc-id"
    values = [data.aws_subnet.ec2_subnet.vpc_id]
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "alb-sg"
  description = "Security Group for ALB"
  vpc_id      = data.aws_subnet.ec2_subnet.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "alb-sg"
  }
}

module "alb" {
  source          = "../../Modules/ALB/V0"
  alb_name        = "FQTS-alb"
  tg_name         = "FQTS-tg"
  vpc_id          = data.aws_subnet.ec2_subnet.vpc_id
  subnet_ids      = data.aws_subnets.all.ids
  security_groups = [aws_security_group.alb_sg.id]

  health_check_path     = var.health_check_path
  health_check_interval = var.health_check_interval
  health_check_timeout  = var.health_check_timeout
  healthy_threshold     = var.healthy_threshold
  unhealthy_threshold   = var.unhealthy_threshold
}
