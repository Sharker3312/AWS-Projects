module "sns" {
  source = "./sns"
}

module "sqs" {
  source = "./sqs"
  topic_arn = module.sns.topic_arn
}

module "lambda" {
  source  = "./lambda"
  topic_arn =    module.sns.topic_arn
  sqs_url =  module.sqs.sqs_url

}

module "bucket" {
  source = "./bucket"
  lambda_function_name   = module.lambda.lambda_function_name
  lambda_function_arn  = module.lambda.lambda_function_arn
}