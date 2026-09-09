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