# CloudFront Terraform Module

This Terraform module provisions an AWS CloudFront Distribution with optional Origin Access Control (OAC), logging to CloudWatch, and support for dynamic cache behaviors using AWS-managed policies.

---

## Features

- ✅ Creates CloudFront Distribution with configurable cache behaviors.
- ✅ Supports default and ordered cache behaviors with dynamic policy lookups.
- ✅ Enables logging to CloudWatch Logs via `aws_cloudwatch_log_delivery` resources.
- ✅ Optionally supports Origin Access Control (OAC).
- ✅ Handles viewer certificate settings (ACM and default).
- ✅ Fully parameterized with tag support and advanced origin configuration.
- ✅ Supports IPv6 and Geo restrictions.

---

## Usage

```hcl
module "cloudfront" {
  source = "..."

  origin                    = "your-origin.example.com"
  acm_certificate_arn      = "arn:aws:acm:..."
  aliases                  = ["cdn.example.com"]
  environment              = "prod"
  comment                  = "CloudFront for frontend"
  price_class              = "PriceClass_100"

  default_allowed_methods        = ["GET", "HEAD"]
  default_cached_methods         = ["GET", "HEAD"]
  default_cache_policy_id        = "Managed-CachingOptimized"
  default_origin_request_policy_id = "Managed-AllViewer"
  default_response_headers_policy_id = "Managed-SecurityHeadersPolicy"

  ordered_cache_behavior = [
    {
      path_pattern                 = "/api/*"
      allowed_methods              = ["GET", "HEAD", "OPTIONS"]
      cached_methods               = ["GET", "HEAD"]
      cache_policy_id              = "Managed-CachingDisabled"
      origin_request_policy_id     = "Managed-AllViewerExceptHostHeader"
      response_headers_policy_id   = "Managed-CORS-with-preflight"
      min_ttl                      = 0
      default_ttl                  = 0
      max_ttl                      = 0
    }
  ]

  cloudfront_default_certificate = false
  ipv6                           = true
  web_acl_id                     = null

  log_retention_in_days          = 30
  log_type                       = "cdn"
  log_output_format              = "JSON"

  enableOriginAccessControl      = true
  oac_description                = "Origin Access Control for S3"
  oac_origin_type                = "s3"
  oac_signing_behavior           = "always"
  oac_signing_protocol           = "sigv4"

  tags = {
    Project = "cdn"
    Env     = "prod"
  }

  role_arn = "arn:aws:iam::123456789012:role/CloudFrontAccessRole"
}
