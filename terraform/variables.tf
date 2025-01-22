variable "alpha_vantage_api_key" {
  description = "Alpha Vantage API Key"
  type        = string
}

variable "email_endpoint" {
  description = "email"
  type        = string
}

variable "stock_symbols" {
  default = "AAPL,MSFT,GOOGL,AMZN,NVDA"
}

