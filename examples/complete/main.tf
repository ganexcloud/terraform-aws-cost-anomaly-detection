provider "aws" {
  region = "us-east-1"
}

module "cost_anomaly_detection_aws_services" {
  source            = "../../"
  name              = "AWSServices"
  monitor_type      = "DIMENSIONAL"
  monitor_dimension = "SERVICE"
  subscriptions = [
    {
      name      = "DevOps"
      frequency = "DAILY"
      threshold_expressions = [
        {
          or = {
            key           = "ANOMALY_TOTAL_IMPACT_ABSOLUTE"
            match_options = ["GREATER_THAN_OR_EQUAL"]
            values        = ["100"]
          },
        },
        {
          or = {
            key           = "ANOMALY_TOTAL_IMPACT_PERCENTAGE"
            match_options = ["GREATER_THAN_OR_EQUAL"]
            values        = ["10"]
          }
        }
      ]
      subscriber_address = "devops@domain.com"
      subscriber_type    = "EMAIL"
    }
  ]
}
