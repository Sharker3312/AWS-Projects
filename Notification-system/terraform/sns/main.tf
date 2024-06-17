resource "aws_sns_topic" "user_updates" {
  name         = var.sns_topic_name
  display_name = var.sns_dislplay_name
  
  
}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = var.protocol
  endpoint  = var.subscriber
}