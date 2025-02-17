# Resource: instance_1a_nic_0
resource "aws_network_interface" "instance_1a_nic_0" {
  subnet_id   = aws_subnet.instance_subnet_1a.id
  private_ips = ["172.16.10.10"]
  security_groups = [aws_security_group.instance_security_group.id]

  tags = {
    Name = "VESTHT-INSTANCE-1A-NIC-0"
  }
}
