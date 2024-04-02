<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.63 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.63 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ce_anomaly_monitor.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ce_anomaly_monitor) | resource |
| [aws_ce_anomaly_subscription.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ce_anomaly_subscription) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_monitor_dimension"></a> [monitor\_dimension](#input\_monitor\_dimension) | (Required, if monitor\_type is DIMENSIONAL) The dimensions to evaluate. Valid values: SERVICE. | `string` | n/a | yes |
| <a name="input_monitor_type"></a> [monitor\_type](#input\_monitor\_type) | (Required) The possible type values. Valid values: DIMENSIONAL \| CUSTOM. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | (Required) The name of the monitor. | `string` | n/a | yes |
| <a name="input_subscriptions"></a> [subscriptions](#input\_subscriptions) | (Optional) A map of tags to assign to the resource. | `list(any)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A map of tags to assign to the resource. | `map(any)` | `{}` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->