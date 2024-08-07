output "instance_id" {
  description = "ID EC2"
  value       = aws_instance.ec2.id
}

output "security_group_id" {
  description = "ID SG"
  value       = aws_security_group.sg.id
}