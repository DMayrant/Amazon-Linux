resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.54.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(local.common_tags, {
    Name = "Us-east-1_VPC"
  })
}

resource "aws_subnet" "public_subnet" {
  count                   = length(var.private_subnet_cidrs)
  availability_zone       = var.availability_zones[count.index]
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  

  tags = merge(local.common_tags, {
    Name = "Public_Subnet"

  }) #for multiple subnets
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidrs)
  availability_zone = var.availability_zones[count.index]
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = var.private_subnet_cidrs[count.index] #for multiple subnets"

  tags = merge(local.common_tags, {
    Name = "private_Subnet"
  })
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = merge(local.common_tags, {
    Name = "Internet_gateway"
  })
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}


resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

}


resource "aws_route_table_association" "public" {
  count          = var.public_subnet_count
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = var.public_subnet_count
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}