resource "aws_lambda_function" "stock_alerts" {
  function_name    = "StockAlertsFunction"
  runtime          = "python3.9"
  handler          = "lambda_function.lambda_handler"
  filename         = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")
  role             = aws_iam_role.lambda_execution_role.arn
  memory_size      = 128
  timeout          = 10
  
  environment {
    variables = {
      ALPHA_VANTAGE_API_KEY = var.alpha_vantage_api_key
      SNS_TOPIC_ARN         = aws_sns_topic.stock_alerts_topic.arn
      STOCK_SYMBOLS         = var.stock_symbols
    }
  }
}