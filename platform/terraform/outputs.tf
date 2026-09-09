output "vpc_id" {
  description = "SentinelForge VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "SentinelForge public subnet ID"
  value       = aws_subnet.public.id
}

output "vpc_cidr" {
  description = "SentinelForge VPC CIDR"
  value       = aws_vpc.main.cidr_block
}

output "platform_instance_id" {
  description = "SentinelForge platform EC2 instance ID"
  value       = aws_instance.platform.id
}

output "platform_public_ip" {
  description = "SentinelForge platform EC2 public IP"
  value       = aws_instance.platform.public_ip
}

output "platform_private_ip" {
  description = "SentinelForge platform EC2 private IP"
  value       = aws_instance.platform.private_ip
}

output "platform_security_group_id" {
  description = "SentinelForge platform security group ID"
  value       = aws_security_group.platform.id
}
output "demo_ecr_repository_url" {
  description = "ECR repository URL for the SentinelForge demo application"
  value       = aws_ecr_repository.demo.repository_url
}

output "github_actions_role_arn" {
  description = "IAM role assumed by GitHub Actions through OIDC"
  value       = aws_iam_role.github_actions.arn
}