resource "aws_sqs_queue" "notification-system" {
  name                       = var.sqs_name
  #Default times by official documentation ⬇
  delay_seconds              = 10
  visibility_timeout_seconds = 30
  max_message_size           = 2048
  message_retention_seconds  = 86400
  receive_wait_time_seconds  = 2
  
  
}
# resource "aws_sqs_queue_policy" "sqs_policy" {
#   queue_url = aws_sqs_queue.notification-system.id

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Principal = {
#           Service = "sns.amazonaws.com"
#         }
#         Action = "sqs:SendMessage"
#         Resource = aws_sqs_queue.notification-system.arn
#         Condition = {
#           ArnEquals = {
#             "aws:SourceArn" = [aws_sns_topic.user_updates.arn]
#           }
#         }
#       }
#     ]
#   })
# }

# Suscribir la cola SQS al tema SNS
resource "aws_sns_topic_subscription" "sns_to_sqs" {
  topic_arn = var.topic_arn
  protocol  = "email"
  endpoint  = "fsharkeraws@gmail.com"
}