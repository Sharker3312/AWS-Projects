#resource "aws_sns_topic" "user_updates"
variable "sns_topic_name" {
  description = "SNS name service"
  type        = string
  default = "email-notification"
}

variable "sns_dislplay_name" {
  description = "SNS Display name"
  type        = string
  default = "s3-upload-notifications"
}

#resource "aws_sns_topic_subscription" "user_updates_sqs_target"

variable "protocol" {
  description = "sns protocol"
  type        = string
  default = "email"
}
variable "subscriber" {
  description = "Subscriber"
  type        = string
  default = "fsharkeraws@gmail.com"
}
# variable "topic_arn" {
#      ## Export sns_arn to use in lambda function
#   description = "Nombre de la función Lambda"
#   type        = string
# }