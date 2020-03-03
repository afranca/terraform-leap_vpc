resource "aws_launch_configuration" "launchconfig" {
  name_prefix     = "launchconfig"
  image_id        = var.AMIS[var.AWS_REGION]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.leapkeypair.key_name
  security_groups = [aws_security_group.allow-ssh-sg.id]
}

resource "aws_autoscaling_group" "autoscaling_group" {
  name                      = "autoscaling_group"
  vpc_zone_identifier       = [aws_subnet.main-public-sb.id]
  launch_configuration      = aws_launch_configuration.launchconfig.name
  min_size                  = 1
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"
  load_balancers            = [aws_elb.my-elb.name]
  force_delete              = true

  tag {
    key                 = "Name"
    value               = "ec2 instance"
    propagate_at_launch = true
  }
}

