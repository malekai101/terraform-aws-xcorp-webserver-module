output instance_ids {
  description = "IDs of EC2 instances"
  value       = aws_instance.application[*].id
}

output "server_ip" {
  description = "The public IPs of the web servers."
  value = aws_instance.application[*].public_ip
}

output "server_dns" {
  description = "The FQDNs of the web servers."
  value = aws_instance.application[*].public_dns
}
