resource "aws_instance" "instance" {
    ami = "ami-084cab24460184bd3" # Ubuntu 22.04 (AMD64)
    instance_type = "t3.micro"

    tags = {
		Name = "VESTHT-INSTANCE-1A"
	}
}