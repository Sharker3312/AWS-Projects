variable "bucket_name" {
  description = "Name of bucket s3" #must be unique in the world
  type        = string
  default = "notification-system-lambda2"
}





#Importing  variables for lambda module
variable "lambda_function_arn" {
  description = "ARN de la función Lambda"
  type        = string
}

variable "lambda_function_name" {
  description = "Nombre de la función Lambda"
  type        = string
}

