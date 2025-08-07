variable "listener_arn" {
  description = "The ARN of the listener"
  type        = string
}

variable "priority" {
  description = "The priority of the rule"
  type        = number
}

variable "target_group_arn" {
  description = "The ARN of the target group to forward traffic to"
  type        = string
}

variable "path_pattern" {
  description = "The path pattern to match for the rule"
  type        = list(string)
  default     = []
}

variable "host_header" {
  description = "The host header to match for the rule"
  type        = list(string)
  default     = []
}

variable "aws_lb_listener_rule_name" {
  description = "The name of the AWS Load Balancer listener rule"
  type        = string
}

variable "stickiness_enabled" {
  description = "Whether to enable stickiness for the target group"
  type        = bool
  default     = false
}

variable "stickiness_duration" {
  description = "The duration for stickiness in seconds"
  type        = number
  default     = 600
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
}
