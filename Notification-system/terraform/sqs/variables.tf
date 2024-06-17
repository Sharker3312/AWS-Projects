variable "sqs_name" {
  description = "SQS Name"
  type        = string
  default = "Notification-email"
}

variable "topic_arn" {
  description = "Topic ard by SNS module"
  type        = string
}




