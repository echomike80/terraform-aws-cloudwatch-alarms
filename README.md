# AWS S3 Bucket with replica Terraform module

Terraform module which creates an AWS Cloudwatch alarms for EC2 on AWS.

## Terraform versions

Terraform 0.12 and newer. 

## Usage

```hcl
resource "aws_sns_topic" "cloudwatch_alarms" {
  name         = "Cloudwatch_Alarms"
  display_name = "Cloudwatch_Alarms"
}

module "cloudwatch_alarms" {
  source            = "/path/to/terraform-aws-cloudwatch-alarms"

  name              = var.name
  region            = var.region

  ec2_instances_list                    = ["i-1234567890", "i-2345678901", "i-3456789012"]
  cloudwatch_autorecover_enabled        = true
  cloudwatch_cpu_utilization_enabled    = true
  cloudwatch_sns_topic_arn              = aws_sns_topic.cloudwatch_alarms_all_nodes.arn
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.12.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.65 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.65 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_metric_alarm.ec2_autorecover](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource |     
| [aws_cloudwatch_metric_alarm.ec2_cpu_utilization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_metric_alarm) | resource | 

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_autorecover_enabled"></a> [cloudwatch\_autorecover\_enabled](#input\_cloudwatch\_autorecover\_enabled) | Enable or disable CloudWatch alarm EC2 autorecover | `bool` | `true` | no |
| <a name="input_cloudwatch_cpu_utilization_enabled"></a> [cloudwatch\_cpu\_utilization\_enabled](#input\_cloudwatch\_cpu\_utilization\_enabled) | Enable or disable CloudWatch alarm CPU utilization | `bool` | `false` | no |
| <a name="input_cloudwatch_sns_topic_arn"></a> [cloudwatch\_sns\_topic\_arn](#input\_cloudwatch\_sns\_topic\_arn) | SNS Topic ARN for CloudWatch alarms | `string` | `null` | no |
| <a name="input_ec2_autorecover_evaluation_periods"></a> [ec2\_autorecover\_evaluation\_periods](#input\_ec2\_autorecover\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold. | `string` | `"2"` | no |
| <a name="input_ec2_autorecover_period"></a> [ec2\_autorecover\_period](#input\_ec2\_autorecover\_period) | The period in seconds over which the specified statistic is applied. | `string` | `"60"` | no |
| <a name="input_ec2_cpu_utilization_evaluation_periods"></a> [ec2\_cpu\_utilization\_evaluation\_periods](#input\_ec2\_cpu\_utilization\_evaluation\_periods) | The number of periods over which data is compared to the specified threshold. | `string` | `"2"` | no |
| <a name="input_ec2_cpu_utilization_period"></a> [ec2\_cpu\_utilization\_period](#input\_ec2\_cpu\_utilization\_period) | The period in seconds over which the specified statistic is applied. | `string` | `"120"` | no |
| <a name="input_ec2_cpu_utilization_threshold"></a> [ec2\_cpu\_utilization\_threshold](#input\_ec2\_cpu\_utilization\_threshold) | The value against which the specified statistic is compared. This parameter is required for alarms based on static thresholds, but should not be used for alarms based on anomaly detection models. | `string` | `"80"` | no |
| <a name="input_ec2_instances_list"></a> [ec2\_instances\_list](#input\_ec2\_instances\_list) | List of EC2 instances for all Cloudwatch alarms | `list(string)` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name to be used on all resources as prefix | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Name of region | `string` | n/a | yes |

## Outputs

No outputs.

## Authors

Module managed by [Marcel Emmert](https://github.com/echomike80).

## License

Apache 2 Licensed. See LICENSE for full details.
