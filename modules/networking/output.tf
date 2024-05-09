# Output: instance_1a_nic_0_id
output "instance_1a_nic_0_id" {
	value = aws_network_interface.instance_1a_nic_0.id
}

# Output: instance_1a_security_group_id
output "instance_1a_security_group_id" {
	value = aws_subnet.instance_1a_security_group_id.id
}