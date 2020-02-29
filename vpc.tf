# Internet VPC
resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"
  tags = {
    Name = "main"
  }
}

# Public Subnets
resource "aws_subnet" "main-public-1" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-central-1a"
  tags  = {
    Name  = "main-public-1"
  }
}


# Internet GW
resource "aws_internet_gateway" "main-igw" {
  vpc_id  = aws_vpc.main.id
  tags = {
    Name ="Main IGW"
  }
}

# Route Tables
resource "aws_route_table" "main-public-rt" {
  vpc_id  = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }
  tags = {
      Name = "main-public-rt"
   }
}

# Route Associations Public
resource "aws_route_table_association" "main-public-rta" {
  subnet_id       = aws_subnet.main-public-1.id
  route_table_id  = aws_route_table.main-public-rt.id
}

