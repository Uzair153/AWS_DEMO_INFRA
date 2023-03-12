
resource "aws_vpc" "vpc_test" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = "${var.vpc_tag}"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc_test.id
  tags = {
    Name = "${var.IGW_tag}"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.vpc_test.id
  route {
    cidr_block = var.RT_cidr
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "${var.RT_tag}"
  }
}

resource "aws_subnet" "subnet_test" {
  vpc_id            = aws_vpc.vpc_test.id
  cidr_block        = var.subnet_cidr
  availability_zone = var.subnet_AZ
  tags = {
    Name = "${var.subnet_tag}"
  }
}

resource "aws_route_table_association" "example_association" {
  subnet_id      = aws_subnet.subnet_test.id
  route_table_id = aws_route_table.RT.id
}

output "vpc_id" {
  value = aws_vpc.vpc_test.id
}



// terraform plan -var-file=variables.tfvars
