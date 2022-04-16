provider "aws" {
  region = element(var.region, 0)
}

resource "aws_vpc" "scott_vpc" {
  cidr_block =       var.cidrblock
  instance_tenancy = "default"

  tags = {
    Name = "Scott-Terraform-test"
  }
}

resource "aws_subnet" "public_subnet"{
    vpc_id = aws_vpc.scott_vpc.id
    cidr_block = var.public_cidrs[0]
    availability_zone = var.az[0]
    map_public_ip_on_launch = true
    tags = {Name = "subnet-public-1"}
}

resource "aws_subnet" "private_subnet"{
    vpc_id = aws_vpc.scott_vpc.id
    cidr_block = var.private_cidrs[0]
    availability_zone = var.az[0]
    tags = {Name = "subnet-private-1"}
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.scott_vpc.id
    tags = {Name = "scott-igw"}
}

resource "aws_route_table" "public_RT_scott_vpc"{
    vpc_id = aws_vpc.scott_vpc.id
    route{
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {Name = "Scott-routes"}
}

resource "aws_route_table_association" "public"{
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_RT_scott_vpc.id
}

output "public_subnet_id" {
    value = aws_subnet.public_subnet.id
  }

output "private_subnet_id"{
    value = aws_subnet.private_subnet.id
  }

output "vpc_id"{
    value = aws_vpc.scott_vpc.id
  }

