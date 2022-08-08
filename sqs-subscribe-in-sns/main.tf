resource "aws_sns_topic" "sns" {
     name = var.sns_name
     tags = var.tags
}

resource "aws_sqs_queue" "sqs" {
    name = var.sqs_name
    tags = var.tags
}

resource "aws_sns_topic_subscription" "subscription" {
  protocol             = var.subscribe_protocol
  topic_arn            = aws_sns_topic.sns.arn
  endpoint             = aws_sqs_queue.sqs.arn
}