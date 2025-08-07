output "arn" {
  description = "The ARN of the target group"
  value       = aws_lb.this.arn
}

output "dns_name" {
  description = "The DNS name of the load balancer"
  value       = aws_lb.this.dns_name
}

output "lb_security_group_id" {
  description = "value of the security group ID for the load balancer"
  value       = module.aws_security_group.id
}

output "http_listener_arn" {
  description = "The ARN of the HTTP listener"
  value       = aws_lb_listener.this_http.arn
}

output "https_listener_arn" {
  description = "The ARN of the HTTPS listener"
  value       = aws_lb_listener.this_https.arn
}

output "zone_id" {
  description = "Canonical hosted zone ID of the load balancer (to be used in a Route 53 Alias record)."
  value       = aws_lb.this.zone_id
}
