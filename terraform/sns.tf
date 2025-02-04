resource "aws_sns_topic" "stock_alerts_topic" {
  name = "StockAlertsTopic"
}

resource "aws_sns_topic_subscription" "email_subscription" {
  topic_arn = aws_sns_topic.stock_alerts_topic.arn
  protocol  = "email"
  endpoint  = "your_email_address" # Replace with your email
}