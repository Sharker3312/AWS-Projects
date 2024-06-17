#resource "aws_lambda_function" "lambda"
variable "filename" {
  description = "filename"
  type        = string
  default = "lambda/lambda_function.zip"
}
variable "function_name" {
  description = "Lambda function name"
  type        = string
  default = "notificaction"
}
variable "handler" {
  description = "handler"
  type        = string
  default = "lambda_function.lambda_handler"
}
variable "runtime" {
  description = "runtime"
  type        = string
  default = "python3.12"
}
#resource "aws_iam_role" "lambda_role"
variable "name_role" {
  description = "Name of lambda role"
  type        = string
  default = "lambda_role"
}

#resource "aws_iam_policy" "lambda_sns_sqs_policy"
variable "name_policy" {
  description = "Full access to SNS and SQS"
  type        = string
  default = "SNS_SQS" 
}


variable "sqs_url" {
  description = "URL SQS"
  type        = string
}
variable "topic_arn" {
  description = "Name of Topic ARN"
  type        = string
}