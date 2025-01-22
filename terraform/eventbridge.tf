resource "aws_cloudwatch_event_rule" "stock_market_trading_hours" {
  name                = "stock-market-trading-hours"
  description         = "Trigger Lambda function every 10 minutes during stock market trading hours"
  schedule_expression = "cron(0/10 9-16 ? * MON-FRI *)"  # Trigger every 10 minutes during trading hours
}

resource "aws_cloudwatch_event_target" "stock_alerts_target" {
  rule = aws_cloudwatch_event_rule.stock_market_trading_hours.name
  arn  = aws_lambda_function.stock_alerts.arn
}

resource "aws_lambda_permission" "allow_eventbridge_to_invoke" {
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.stock_alerts.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.stock_market_trading_hours.arn
}