resource "aws_instance" "instance" {
    ami = "ami-084cab24460184bd3" # Ubuntu 22.04 (AMD64)
    instance_type = "t3.micro"
    key_name = aws_key_pair.instance_key_pair.key_name
    user_data_base64 = base64encode(data.template_file.user_data_script.rendered)

    network_interface {
      network_interface_id = var.instance_1a_nic_0_id
      device_index = 0
    }

    metadata_options {
      http_tokens = "required"
    }

    tags = {
      Name = "VESTHT-INSTANCE-1A"
    }
}

# Resource: instance_1a_eip
resource "aws_eip" "instance_1a_eip" {
  instance = aws_instance.instance.id
}


resource "aws_eip_association" "instance_1a_eip_association" {
  instance_id   = aws_instance.instance.id
  allocation_id = aws_eip.instance_1a_eip.id
}