output "sns_topic_arn" {
  value = aws_sns_topic.stock_alerts_topic.arn
}

output "lambda_function_name" {
  value = aws_lambda_function.stock_alerts.function_name
}