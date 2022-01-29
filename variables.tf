variable "name" {
  description = "Name to be used on all resources as prefix"
  type        = string
}

variable "cloudwatch_sns_topic_arn" {
  description = "SNS Topic ARN for CloudWatch alarms"
  type        = string
  default     = null
}

variable "cloudwatch_autorecover_enabled" {
  description = "Enable or disable CloudWatch alarm EC2 autorecover"
  type        = bool
  default     = true
}

variable "cloudwatch_cpu_utilization_enabled" {
  description = "Enable or disable CloudWatch alarm CPU utilization"
  type        = bool
  default     = false
}

variable "ec2_autorecover_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
  default     = "2"
}

variable "ec2_cpu_utilization_evaluation_periods" {
  description = "The number of periods over which data is compared to the specified threshold."
  type        = string
  default     = "2"
}

variable "ec2_instances_list" {
  description = "List of EC2 instances for all Cloudwatch alarms"
  type        = list(string)
  default     = null
}

variable "ec2_autorecover_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
  default     = "60"
}

variable "ec2_cpu_utilization_period" {
  description = "The period in seconds over which the specified statistic is applied."
  type        = string
  default     = "120"
}

variable "ec2_cpu_utilization_threshold" {
  description = "The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models."
  type        = string
  default     = "80"
}

variable "region" {
  description = "Name of region"
  type        = string
}