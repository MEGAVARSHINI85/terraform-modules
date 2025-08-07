# AWS SES Email Identity Terraform Module

This module verifies a list of email addresses as SES email identities and attaches an individual IAM policy to each.

## Features

- Verifies multiple email identities in SES.
- Attaches an individual identity policy to each verified email.

## Usage

```hcl
module "ses_email_identity" {
  source = "./path-to-this-module"

  emails = [
    "no-reply@example.com",
    "support@example.com"
  ]

  ses_email_identity_policy = [
    jsonencode({
      Version = "2012-10-17",
      Statement = [{
        Effect = "Allow",
        Principal = {
          Service = "ses.amazonaws.com"
        },
        Action = "SES:SendEmail",
        Resource = "*"
      }]
    }),
    jsonencode({
      Version = "2012-10-17",
      Statement = [{
        Effect = "Allow",
        Principal = {
          Service = "ses.amazonaws.com"
        },
        Action = "SES:SendRawEmail",
        Resource = "*"
      }]
    })
  ]
}
