# Resource: instance_subnet_1a
resource "aws_subnet" "instance_subnet_1a" {
	vpc_id = aws_vpc.vpc.id
	cidr_block = "172.16.10.0/24"
	availability_zone = data.aws_availability_zones.availability_zones.names[0]

	tags = {
		Name = "VESTHT-VPC-INSTANCE-SUBNET-1A"
	}
}
