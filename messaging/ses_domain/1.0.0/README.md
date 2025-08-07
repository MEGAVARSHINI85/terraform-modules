# AWS SES Domain Identity Terraform Module

This module configures an Amazon SES domain identity, enabling DKIM, domain verification, identity policy attachment, and SNS topic notification setup.

## Features

- Create SES domain identity
- Enable DKIM signing
- Verify domain ownership
- Attach IAM policy to SES identity
- Configure SNS topics for SES notifications (Bounce, Complaint, Delivery)
- Outputs for identity ARN, DKIM tokens, and verification status

## Usage

```hcl
module "ses_identity" {
  source = "./path-to-this-module"

  domain_name                = "example.com"
  topic_arn                  = "arn:aws:sns:us-east-1:123456789012:ses-topic"
  notification_type          = ["Bounce", "Complaint", "Delivery"]
  ses_domain_identity_policy = file("ses-policy.json")
  aws_ses_identity_policy_name = "example-ses-policy"
  zone_id                    = "Z123456ABCDEFG"
}
