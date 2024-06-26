# Criar Internet Gateway
resource "aws_internet_gateway" "internet-gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "iac-internet-gw"
    Terraformed = "true"
  }
  depends_on = [
    aws_vpc.main
  ]
}

# Criar IPs dos Nat Gateways
resource "aws_eip" "ip-nat-gateway-1" {
  vpc = true

  tags = {
    Terraformed = "true"
  }
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.internet-gw
  ]
}

resource "aws_eip" "ip-nat-gateway-2" {
  vpc = true

  tags = {
    Terraformed = "true"
  }
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.internet-gw
  ]
}

# Criar Nat Gateways
resource "aws_nat_gateway" "nat-gateway-1" {
  allocation_id = aws_eip.ip-nat-gateway-1.id
  subnet_id     = aws_subnet.publica1.id

  tags = {
    Name        = "iac-nat-gw-1"
    Terraformed = "true"
  }
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.internet-gw,
    aws_eip.ip-nat-gateway-1
  ]
}

resource "aws_nat_gateway" "nat-gateway-2" {
  allocation_id = aws_eip.ip-nat-gateway-2.id
  subnet_id     = aws_subnet.publica2.id

  tags = {
    Name        = "iac-nat-gw-2"
    Terraformed = "true"
  }
  depends_on = [
    aws_vpc.main,
    aws_internet_gateway.internet-gw,
    aws_eip.ip-nat-gateway-2
  ]
}
