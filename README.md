Overview

The Stock Alert System is a real-time, event-driven notification system that provides live stock market updates to users. Built using AWS Lambda, Amazon SNS, Terraform, and the Alpha Vantage API, the system fetches stock data for selected symbols, processes it, and sends timely alerts to users via email or SMS. The alerts contain real-time stock prices and percentage changes, helping users stay informed about market movements during trading hours.

Features
	•	Real-time stock alerts: Provides stock price updates and change percentages for specified stock symbols.
	•	SMS/Email notifications: Sends alerts via AWS SNS to subscribed users.
	•	Customisable stock symbols: Supports multiple stock symbols for real-time tracking.
	•	Scalable: Utilises AWS Lambda for serverless processing, allowing scaling based on demand.
	•	Event-driven architecture: Uses AWS EventBridge to trigger the Lambda function based on a defined schedule.
	•	Terraform infrastructure: Automates the deployment and configuration of AWS resources.

Prerequisites

Before you begin, ensure that you have the following installed and configured on your machine:
	•	Git
	•	AWS CLI
	•	Terraform
	•	Python
	•	AWS account
	•	Alpha Vantage API Key

Setup

1. Clone the Repository

Clone this repository to your local machine:

git clone https://github.com/EVUmanny/stock-alert-system.git
cd stock-alert-system

2. Install Dependencies

The system relies on Python libraries for making API requests. Install them using pip:

pip install -r requirements.txt

3. Configure AWS Credentials

Ensure your AWS credentials are configured to allow access to your AWS account:

aws configure

This command will prompt you to enter your AWS Access Key, Secret Key, and default region.

4. Set Up Environment Variables

Create a .env file in the root of your project and populate it with the necessary environment variables:

ALPHA_VANTAGE_API_KEY=your_alpha_vantage_api_key
SNS_TOPIC_ARN=your_sns_topic_arn
STOCK_SYMBOLS=AAPL,MSFT,GOOGL,AMZN,NVDA

	•	ALPHA_VANTAGE_API_KEY: Your personal API key from Alpha Vantage to fetch stock data.
	•	SNS_TOPIC_ARN: The ARN of your SNS topic for sending notifications.
	•	STOCK_SYMBOLS: A comma-separated list of stock symbols to track.

5. Deploy Infrastructure Using Terraform

The system’s infrastructure is defined using Terraform. To deploy it:
	1.	Initialize Terraform:

terraform init


	2.	Review the planned infrastructure changes:

terraform plan


	3.	Apply the changes to create the resources:

terraform apply



6. Update Lambda Function

Upload the Lambda function code in a ZIP file to AWS Lambda:
	1.	Navigate to the Lambda function directory:

cd lambda


	2.	Zip the function code:

zip -r lambda_function.zip .


	3.	Update the Lambda function using the AWS CLI:

aws lambda update-function-code --function-name StockAlertsFunction --zip-file fileb://lambda_function.zip



7. Test the System

Once deployed, you can test the Lambda function using the AWS Lambda Console or by invoking it manually using the AWS CLI:

aws lambda invoke --function-name StockAlertsFunction response.json

Check the response.json file for the output.

Architecture

1. AWS Lambda:
	•	Executes the stock alert function, fetching stock data from Alpha Vantage, processing it, and sending the alerts via SNS.

2. Amazon SNS (Simple Notification Service):
	•	Distributes notifications (via email/SMS) to subscribers when stock data is processed.

3. Amazon EventBridge:
	•	Schedules the Lambda function execution during trading hours (9 AM to 4 PM).

4. Terraform:
	•	Automates infrastructure provisioning and management, including setting up AWS Lambda, SNS, EventBridge, and IAM roles.

Usage

Once the system is set up and running, stock price alerts will be sent to subscribers via SNS notifications during trading hours (9 AM to 4 PM). The system will continuously fetch the stock data for the symbols specified in the environment variable STOCK_SYMBOLS.

Example Notification:

An example message sent by SNS might look like this:

Stock: AAPL, Price: 222.64, Change: -3.19%
Stock: MSFT, Price: 428.50, Change: -0.12%
Stock: GOOGL, Price: 198.05, Change: 1.04%
Stock: AMZN, Price: 230.71, Change: 2.11%
Stock: NVDA, Price: 140.83, Change: 2.27%

Customising Stock Symbols:

To change the symbols being tracked, update the STOCK_SYMBOLS environment variable in the .env file and re-deploy the Lambda function.

Security Considerations
	•	API Key: Make sure the ALPHA_VANTAGE_API_KEY is stored securely in your environment and not exposed in your code or version control.
	•	SNS Permissions: Ensure that the Lambda function has the correct IAM permissions to publish to the SNS topic and access other necessary AWS resources.
	•	Sensitive Information: Avoid committing sensitive files (e.g., .env, terraform.tfstate) to your version control repository. Use .gitignore to exclude these files.

Troubleshooting

If you encounter any issues, consider checking the following:
	1.	Lambda Logs: View logs in Amazon CloudWatch to troubleshoot any errors during function execution.
	2.	API Quota: Ensure that your Alpha Vantage API key is within its usage limits.
	3.	SNS Delivery Issues: Check the subscription status in the SNS dashboard to ensure messages are being delivered to the intended recipients.

Contributing

We welcome contributions to improve the system. If you’d like to contribute, please fork the repository and create a pull request. Ensure that your changes are well-documented and tested.

License

This project is licensed under the MIT License - see the LICENSE file for details.

For any queries or support requests, feel free to contact me:

This README.md includes an overview of the project, instructions for setup, and details about the architecture, usage, and security considerations. It’s structured to help new developers and users get started quickly with your project.
