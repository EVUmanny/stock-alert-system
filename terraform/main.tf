resource "aws_cloudwatch_metric_alarm" "lambda_error_alarm" {
  alarm_name          = "LambdaErrorAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Errors"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "Sum"
  threshold           = 1
  alarm_description   = "Triggered when Lambda function has errors"
  actions_enabled     = true

  dimensions = {
    FunctionName = aws_lambda_function.stock_alerts.function_name
  }

  alarm_actions = [aws_sns_topic.stock_alerts_topic.arn]
}


resource "aws_cloudwatch_metric_alarm" "lambda_high_duration_alarm" {
  alarm_name          = "LambdaHighDurationAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "Duration"
  namespace           = "AWS/Lambda"
  period              = 60
  statistic           = "Average"
  threshold           = 1000 # Duration in milliseconds
  alarm_description   = "Triggered when Lambda execution duration exceeds threshold"
  actions_enabled     = true

  dimensions = {
    FunctionName = aws_lambda_function.stock_alerts.function_name
  }

  alarm_actions = [aws_sns_topic.stock_alerts_topic.arn]
}