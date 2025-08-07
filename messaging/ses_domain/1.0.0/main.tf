resource "aws_ses_domain_identity" "domain_identity" {
  domain = var.domain_name
}

resource "aws_ses_domain_dkim" "dkim_identity" {
  domain = aws_ses_domain_identity.domain_identity.domain
}

resource "aws_ses_domain_identity_verification" "domain_identity_verification" {
  domain = aws_ses_domain_identity.domain_identity.id
}

resource "aws_ses_identity_policy" "example" {
  identity = aws_ses_domain_identity.domain_identity.id
  name     = var.aws_ses_identity_policy_name
  policy   = var.ses_domain_identity_policy
}

resource "aws_ses_identity_notification_topic" "test" {
  for_each = toset(var.notification_type)

  topic_arn                = var.topic_arn
  notification_type        = each.key
  identity                 = aws_ses_domain_identity.domain_identity.domain
  include_original_headers = true
}