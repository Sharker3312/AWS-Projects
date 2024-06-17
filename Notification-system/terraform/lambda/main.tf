resource "aws_lambda_function" "lambda" {
  filename         = var.filename # Asegúrate de tener el archivo zip con tu código Lambda
  function_name    = var.function_name
  handler          = var.handler # Cambia el handler según tu código
  runtime          = var.runtime # Cambia la versión de runtime según tu código
  role             = aws_iam_role.lambda_role.arn

   environment {
     variables = {
       SQS_QUEUE_URL = var.sqs_url
       #SNS_TOPIC_ARN = var.topic_arn
     }
   }
}

resource "aws_iam_role" "lambda_role" {
  name = var.name_role

  assume_role_policy = file("lambda/lambda_assume_role_policy.json") 
}

resource "aws_iam_policy" "lambda_sns_sqs_policy" {
  name        = var.name_policy
  policy      = file("lambda/lambda_policy.json")  
}

resource "aws_iam_role_policy_attachment" "lambda_sns_sqs_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_sns_sqs_policy.arn
}


