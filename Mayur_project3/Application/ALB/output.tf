output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.alb.alb_dns_name
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = module.alb.alb_arn
}

output "alb_listener_arn" {
  description = "ARN of the ALB Listener"
  value       = module.alb.listener_arn
}

output "alb_target_group_arn" {
  description = "ARN of the ALB Target Group"
  value       = module.alb.target_group_arn
}
