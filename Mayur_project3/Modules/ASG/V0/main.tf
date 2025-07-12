resource "aws_launch_template" "this" {
  name_prefix   = var.name_prefix
  image_id      = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  # 🔥 No logic here — user_data is passed already rendered
  //user_data = var.setup_script_content
  # ✅ Conditionally include user_data
  //user_data = length(trimspace(var.setup_script_content)) > 0 ? var.setup_script_content : null


  iam_instance_profile {
    name = var.iam_instance_profile
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = var.security_group_ids
  }

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"
    tags          = var.tags
  }
}

resource "aws_autoscaling_group" "this" {
  name                = "${var.name_prefix}-asg"
  desired_capacity    = var.desired_capacity
  max_size            = var.max_size
  min_size            = var.min_size
  vpc_zone_identifier = var.subnet_ids
  target_group_arns   = var.target_group_arns
  health_check_type   = "EC2"
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = var.name_prefix
    propagate_at_launch = true
  }

  depends_on = [aws_launch_template.this]
}

resource "aws_autoscaling_policy" "target_tracking_policy" {
  name                      = "${var.name_prefix}-target-tracking"
  policy_type               = "TargetTrackingScaling"
  estimated_instance_warmup = 300
  autoscaling_group_name    = aws_autoscaling_group.this.name

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = var.target_cpu_utilization
  }
}
