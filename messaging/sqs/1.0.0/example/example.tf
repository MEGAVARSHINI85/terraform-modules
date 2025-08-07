provider "aws" {
  region = "us-east-1"
}

module "sqs_queue" {
  source = "./path-to-your-module" # Update with actual module path

  sqs_name                   = "order-processing-queue"
  delay_seconds              = 60
  max_message_size           = 262144
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 10
  visibility_timeout_seconds = 45

  sqs_managed_sse_enabled = true
  enable_sqs_encryption   = true
  use_custom_kms_key      = true
  kms_key_arn             = "arn:aws:kms:us-east-1:123456789012:key/abcd1234"
  kms_master_key_id       = "alias/sqs/kms"

  create_dlq                    = true
  dlq_name                      = "order-processing-dlq"
  dlq_message_retention_seconds = 345600
  max_receive_count             = 4

  tags = {
    Environment = "prod"
    Owner       = "order-team"
  }
}
