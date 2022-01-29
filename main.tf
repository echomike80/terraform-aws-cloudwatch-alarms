resource "aws_cloudwatch_metric_alarm" "ec2_autorecover" {
  count                     = var.cloudwatch_autorecover_enabled ? length(var.ec2_instances_list) : 0
  alarm_name                = var.cloudwatch_sns_topic_arn == null ? format("%s-%s-autorecover", var.name, element(var.ec2_instances_list, count.index)) : format("%s-%s-autorecover-and-notify", var.name, element(var.ec2_instances_list, count.index))
  namespace                 = "AWS/EC2"
  evaluation_periods        = var.ec2_autorecover_evaluation_periods
  period                    = var.ec2_autorecover_period
  alarm_description         = var.cloudwatch_sns_topic_arn == null ? format("Recover EC2 instance %s when underlying hardware fails.", element(var.ec2_instances_list, count.index)) : format("Recover EC2 instance %s when underlying hardware fails and notify.", element(var.ec2_instances_list, count.index))
  alarm_actions             = var.cloudwatch_sns_topic_arn == null ? ["arn:aws:automate:${var.region}:ec2:recover"] : ["arn:aws:automate:${var.region}:ec2:recover", var.cloudwatch_sns_topic_arn]
  statistic                 = "Minimum"
  comparison_operator       = "GreaterThanThreshold"
  threshold                 = "0"
  metric_name               = "StatusCheckFailed_System"
  dimensions = {
    InstanceId = element(var.ec2_instances_list, count.index)
  }
}

resource "aws_cloudwatch_metric_alarm" "ec2_cpu_utilization" {
  count                     = var.cloudwatch_cpu_utilization_enabled && var.cloudwatch_sns_topic_arn != null ? length(var.ec2_instances_list) : 0
  alarm_name                = format("%s-%s-cpu-utilization-notify", var.name, element(var.ec2_instances_list, count.index))
  namespace                 = "AWS/EC2"
  evaluation_periods        = var.ec2_cpu_utilization_evaluation_periods
  period                    = var.ec2_cpu_utilization_period
  alarm_description         = format("Monitor and notify cpu utilization of EC2 instance %s", element(var.ec2_instances_list, count.index))
  alarm_actions             = [var.cloudwatch_sns_topic_arn]
  ok_actions                = [var.cloudwatch_sns_topic_arn]
  statistic                 = "Average"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  threshold                 = var.ec2_cpu_utilization_threshold
  metric_name               = "CPUUtilization"
  dimensions = {
    InstanceId = element(var.ec2_instances_list, count.index)
  }
}