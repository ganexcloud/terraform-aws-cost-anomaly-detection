variable "name" {
  description = "(Required) The name of the monitor."
  type        = string
}

variable "monitor_type" {
  description = "(Required) The possible type values. Valid values: DIMENSIONAL | CUSTOM."
  type        = string
}

variable "monitor_dimension" {
  description = "(Required, if monitor_type is DIMENSIONAL) The dimensions to evaluate. Valid values: SERVICE."
  type        = string
}

variable "subscriptions" {
  type        = list(any)
  description = " (Optional) A map of tags to assign to the resource. "
  default     = []
}

variable "tags" {
  type        = map(any)
  description = " (Optional) A map of tags to assign to the resource. "
  default     = {}
}