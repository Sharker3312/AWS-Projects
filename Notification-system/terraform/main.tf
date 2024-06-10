module "sns" {
  source = "./sns"
}

module "sqs" {
  source = "./sqs"
}

module "lambda" {
  source  = "./lambda"
  sns_arn =    module.sns.sns_arn

}

module "bucket" {
  source = "./bucket"
  lambda_function_name   = module.lambda.lambda_function_name
  lambda_function_arn  = module.lambda.lambda_function_arn
}