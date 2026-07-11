
resource "aws_vpc" "student_sms_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "student-sms-vpc"
  }
}

# 2. Public Subnet 01 (Availability Zone A)
resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.student_sms_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "sms-public-subnet-a"
  }
}

# 3. Public Subnet 02 (Availability Zone B)
resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.student_sms_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "sms-public-subnet-b"
  }
}

# 4. Internet Gateway 
resource "aws_internet_gateway" "sms_igw" {
  vpc_id = aws_vpc.student_sms_vpc.id

  tags = {
    Name = "sms-internet-gateway"
  }
}

# 5. Route Table
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.student_sms_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sms_igw.id
  }

  tags = {
    Name = "sms-public-route-table"
  }
}

# 6. Route Table 
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.public_subnet_b.id
  route_table_id = aws_route_table.public_rt.id
}