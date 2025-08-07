# AWS SQS Queue Terraform Module

This Terraform module provisions a standard Amazon SQS queue with optional support for:
- Dead Letter Queue (DLQ)
- Server-side encryption using AWS-managed or customer-managed KMS key
- Redrive policy setup

## Features

- Creates a primary SQS queue with advanced configuration options
- Optionally creates a Dead Letter Queue (DLQ)
- Adds redrive policy linking main queue to DLQ
- Supports managed or customer-managed encryption
- Fully taggable

## Usage

```hcl
module "sqs_queue" {
  source = "./path-to-this-module"

  sqs_name                    = "my-app-queue"
  delay_seconds               = 30
  max_message_size            = 262144
  message_retention_seconds   = 86400
  receive_wait_time_seconds   = 10
  visibility_timeout_seconds  = 45
  sqs_managed_sse_enabled     = true
  enable_sqs_encryption       = true
  use_custom_kms_key          = true
  kms_key_arn                 = "arn:aws:kms:us-east-1:123456789012:key/abcd-1234"
  kms_master_key_id           = "alias/my-key"

  create_dlq                  = true
  dlq_name                    = "my-app-dlq"
  dlq_message_retention_seconds = 345600
  max_receive_count           = 5

  tags = {
    Environment = "production"
    Team        = "backend"
  }
}
