# Resource: instance_security_group
resource "aws_security_group" "instance_security_group" {
	vpc_id = aws_vpc.vpc.id
	name = "VESTHT-INSTANCE-1A-SG"

	ingress {
		to_port = 22
		from_port = 22
		protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
		description = "ANY:SSH"
	}

	egress {
		to_port = 0
		from_port = 0
		protocol = -1
		cidr_blocks = [ "0.0.0.0/0" ]
		description = "ANY:ANY"
	}

	tags = {
		Name = "VESTHT-INSTANCE-1A-SG"
	}
}