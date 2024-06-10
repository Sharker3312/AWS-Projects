output "sqs_url" {
  value = aws_sqs_queue.notification-system.id
}