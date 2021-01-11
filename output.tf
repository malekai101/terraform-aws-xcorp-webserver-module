output instance_ids {
  description = "IDs of EC2 instances"
  value       = aws_instance.application.*.id
}

output lb_dns {
    description = "The dns name of the load balancer"
    value = aws_lb.application_lb.dns_name
}