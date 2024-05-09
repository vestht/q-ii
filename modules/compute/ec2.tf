resource "aws_instance" "instance" {
    ami = "ami-084cab24460184bd3" # Ubuntu 22.04 (AMD64)
    instance_type = "t3.micro"
    key_name = aws_key_pair.instance_key_pair.key_name

    network_interface {
      network_interface_id = var.instance_1a_nic_0_id
      device_index = 0
    }

    tags = {
      Name = "VESTHT-INSTANCE-1A"
    }
}