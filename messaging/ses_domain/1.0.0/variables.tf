variable "domain_name" {
  type        = string
  description = "The domain name for the SES identity"
}

variable "topic_arn" {
  type        = string
  description = "The ARN of the SNS topic to use for notifications"
}

variable "notification_type" {
  type        = list(string)
  description = "The type of notifications to enable for the SES identity (e.g., ['Bounce', 'Complaint'])"
  default     = ["Bounce", "Complaint", "Delivery"]
}

variable "ses_domain_identity_policy" {
  type        = string
  description = "IAM policy JSON string to allow SES identity sending"
}

variable "aws_ses_identity_policy_name" {
  type        = string
  description = "Name of the SES identity policy"

}

variable "zone_id" {
  description = "The Route 53 hosted zone ID"
  type        = string
  default     = "" # or make it required if always needed
}

