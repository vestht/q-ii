# Internet Gateway
resource "aws_internet_gateway" "internet_gateway" {
	vpc_id = aws_vpc.vpc.id

	tags = {
		Name = "VESTHT-VPC-IGW"
	}
}


# Security Group (Default)
resource "aws_default_security_group" "default_security_group" {
	vpc_id = aws_vpc.vpc.id

	ingress {
		self = true
		to_port = 0
		from_port = 0
		protocol = -1
		description = "ANY:SELF"
	}

	egress {
		to_port = 0
		from_port = 0
		protocol = -1
		cidr_blocks = [ "0.0.0.0/0" ]
		description = "ANY:ANY"
	}

	tags = {
		Name = "VESTHT-VPC-DEFAULT-SG"
	}
}


# Network ACL
resource "aws_default_network_acl" "default_network_acl" {
	default_network_acl_id = aws_vpc.vpc.default_network_acl_id

	ingress {
		protocol = -1
		rule_no = 100
		action = "allow"
		cidr_block = "0.0.0.0/0"
		from_port = 0
		to_port = 0
	}

	egress {
		protocol = -1
		rule_no = 100
		action = "allow"
		cidr_block = "0.0.0.0/0"
		from_port = 0
		to_port = 0
	}

	tags = {
		Name = "VESTHT-VPC-DEFAULT-NACL"
	}
}


# Route Table (Default)
resource "aws_default_route_table" "default_route_table" {
	default_route_table_id = aws_vpc.vpc.default_route_table_id

	route {
        cidr_block = "0.0.0.0/0"
		gateway_id = aws_internet_gateway.internet_gateway.id
    }

	tags = {
		Name = "VESTHT-VPC-DEFAULT-RTB"
	}
}


# VPC
resource "aws_vpc" "vpc" {
	cidr_block = "172.16.0.0/16"
	instance_tenancy = "default"
	enable_dns_support = true
	enable_dns_hostnames = true

	tags = {
		Name = "VESTHT-VPC"
	}
}
