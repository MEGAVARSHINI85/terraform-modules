resource "aws_sqs_queue" "dlq" {
  name                      = var.dlq_name
  message_retention_seconds = var.dlq_message_retention_seconds
  tags                      = var.tags
  count                     = var.create_dlq ? 1 : 0
}

resource "aws_sqs_queue" "sqs" {
  name                       = var.sqs_name
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  visibility_timeout_seconds = var.visibility_timeout_seconds
  redrive_policy = var.create_dlq ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dlq[0].arn
    maxReceiveCount     = var.max_receive_count
  }) : null

  sqs_managed_sse_enabled = var.sqs_managed_sse_enabled
  # kms_master_key_id = var.enable_sqs_encryption && var.use_custom_kms_key ? var.kms_key_arn : null
  kms_master_key_id = var.kms_master_key_id
  tags              = var.tags

}
