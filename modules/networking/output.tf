# Output: instance_1a_subnet_id
output "instance_1a_subnet_id" {
	value = aws_subnet.instance_subnet_1a.id
}

# Output: instance_1a_security_group_id
output "instance_1a_security_group_id" {
	value = aws_subnet.instance_1a_security_group_id.id
}