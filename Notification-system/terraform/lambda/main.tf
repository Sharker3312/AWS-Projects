resource "aws_lambda_function" "lambda" {
  filename         = "lambda/lambda_function.zip" # Asegúrate de tener el archivo zip con tu código Lambda
  function_name    = "notification"
  handler          = "lambda_function.lambda_handler" # Cambia el handler según tu código
  runtime          = "python3.12" # Cambia la versión de runtime según tu código
  role             = aws_iam_role.lambda_role.arn

   environment {
     variables = {
       #SQS_QUEUE_URL = module.sqs.aws_sq
       SNS_TOPIC_ARN = var.sns_arn
     }
   }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy =file("lambda/lambda_assume_role_policy.json") 
}

resource "aws_iam_policy" "lambda_sns_sqs_policy" {
  name        = "LambdaSNSandSQSFullAccess"
  description = "Permisos completos para SNS y SQS"
  policy      = file("lambda/lambda_policy.json") 
}

resource "aws_iam_role_policy_attachment" "lambda_sns_sqs_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_sns_sqs_policy.arn
}


