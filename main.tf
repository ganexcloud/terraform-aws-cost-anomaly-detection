resource "aws_ce_anomaly_monitor" "this" {
  name              = var.name
  monitor_type      = var.monitor_type
  monitor_dimension = var.monitor_dimension
  tags              = var.tags
}

resource "aws_ce_anomaly_subscription" "this" {
  for_each         = { for subcription in var.subscriptions : subcription.name => subcription }
  name             = each.value.name
  monitor_arn_list = [aws_ce_anomaly_monitor.this.arn]
  frequency        = each.value.frequency
  dynamic "threshold_expression" {
    for_each = [each.value.threshold_expressions != null ? [1] : []]
    content {
      dynamic "and" {
        for_each = [for x in each.value.threshold_expressions : x if lookup(x, "and", null) != null]
        content {
          dynamic "dimension" {
            for_each = and.value.and != null ? [and.value.and] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }
        }
      }
      dynamic "or" {
        for_each = [for x in each.value.threshold_expressions : x if lookup(x, "or", null) != null]
        content {
          dynamic "dimension" {
            for_each = or.value.or != null ? [or.value.or] : []
            content {
              key           = dimension.value.key
              match_options = dimension.value.match_options
              values        = dimension.value.values
            }
          }
        }
      }
    }
  }

  subscriber {
    address = each.value.subscriber_address
    type    = each.value.subscriber_type
  }
}