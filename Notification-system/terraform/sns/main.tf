resource "aws_sns_topic" "user_updates" {
  name         = "notification-system"
  display_name = "S3-Upload-NOtification"
  
}

#data "aws_sns_topic" "user_updates" {
  #name = "notification-system"
#}

resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = "fsharkeraws@gmail.com"
}