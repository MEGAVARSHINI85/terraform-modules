variable "hosted_zone_name" {
  description = "The name of the hosted zone for the ACM certificate."
  type        = string
}

variable "domain_name" {
  description = "The domain name for the ACM certificate."
  type        = string
}

variable "hosted_private_zone" {
  description = "The name of the Route53 hosted zone."
  type        = string
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the ACM certificate."
  type        = map(string)
}