variable "aws_region" {
  description = "AWS region for SentinelForge infrastructure"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name used for resource naming"
  type        = string
  default     = "sentinelforge"
}

variable "vpc_cidr" {
  description = "CIDR block for the SentinelForge VPC"
  type        = string
  default     = "10.50.0.0/16"
}