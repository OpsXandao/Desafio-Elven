#    Declaração do Grupo de Segurança
resource "aws_security_group" "sg_wordpress" {
  name        = "sg_wordpress"
  description = "Allow SSH, HTTP and Node inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_ssh_http_node"
  }
}
#   Regras de Entrada do Grupo de Segurança para IPv4
resource "aws_security_group_rule" "sg_wordpress_ipv4" {
  type              = "ingress"
  description       = "SSH"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg_wordpress.id
}

resource "aws_security_group_rule" "sg_wordpress_HTTP" {
  description       = "HTTP"
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg_wordpress.id
}

resource "aws_security_group_rule" "sg_wordpress_Node_Exporter" {
  description       = "Node Exporter"
  type              = "ingress"
  from_port         = 9100
  to_port           = 9100
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.sg_wordpress.id
}

#    Regras de Saída do Grupo de Segurança para IPv4
resource "aws_security_group_rule" "allow_all_traffic_ipv4" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg_wordpress.id
}

#   Regras de Saída do Grupo de Segurança para IPv6
resource "aws_security_group_rule" "allow_all_traffic_ipv6" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.sg_wordpress.id
}

#   Declaração Groupo Segurança RDS
resource "aws_security_group" "allow_rds" {
  name        = "allow_rds"
  description = "Allow MySQL traffic to EC2 instances"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_rds"
  }
}

#   Regras de Entrada do Grupo de Segurança para IPv4
resource "aws_security_group_rule" "allow_all_traffic_MySQL" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.allow_rds.id
}


#    Regras de Saída do Grupo de Segurança para IPv4
resource "aws_security_group_rule" "allow_all_traffic_rds_ipv4" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_rds.id
}

#   Regras de Saída do Grupo de Segurança para IPv6
resource "aws_security_group_rule" "allow_all_traffic_rds_ipv6" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.allow_rds.id
}

#   Criar Grupo Segurança do Prometheus + Grafana
resource "aws_security_group" "allow_monitor" {
  name        = "allow_monitor"
  description = "Allows monitoring traffic"
  vpc_id      = aws_vpc.main.id
  tags = {
    Name = "allow_monitor"
  }
}

#   Regras de Entrada do Grupo de Segurança para IPv4
resource "aws_security_group_rule" "allow_monitor_ipv4" {
  type              = "ingress"
  description       = "SSH"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.allow_monitor.id
}

#   Regras de Entrada do Grupo de Segurança para o Grafana
resource "aws_security_group_rule" "allow_monitor_grafana" {
  type              = "ingress"
  description       = "Grafana"
  from_port         = 3000
  to_port           = 3000
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.allow_monitor.id
}

#   Regras de Entrada do Grupo de Segurança para o Prometheus
resource "aws_security_group_rule" "allow_monitor_prometheus" {
  type              = "ingress"
  description       = "Prometheus"
  from_port         = 9090
  to_port           = 9090
  protocol          = "tcp"
  cidr_blocks       = [aws_vpc.main.cidr_block]
  security_group_id = aws_security_group.allow_monitor.id
}

#   Regras de Saída do Grupo de Segurança para o ipv4
resource "aws_security_group_rule" "allow_all_traffic_monitor_ipv4" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_monitor.id
}