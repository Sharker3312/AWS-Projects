resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name # Cambia el nombre del bucket según tus necesidades

}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.bucket.id

  lambda_function {
    lambda_function_arn = var.lambda_function_arn
    events              = ["s3:ObjectCreated:*"]
    #filter_prefix       = "uploads/"
  }
}

 #Dar permisos a Lambda para ser invocado por S3
resource "aws_lambda_permission" "allow_s3_to_invoke" {
  statement_id  = "AllowS3Invoke"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.bucket.arn

}
