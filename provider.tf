provider "aws" {
  region = var.aws_region
}

# Variables
variable "aws_region" {
  description = "The AWS region to create resources"
  default     = "us-east-1"  # Change this to your preferred region
}
