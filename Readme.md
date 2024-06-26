## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.16 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.bd_wordpress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.db_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_eip.ip-nat-gateway-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip.ip-nat-gateway-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_instance.monitoring_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_instance.wordpress_server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_internet_gateway.internet-gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_key_pair.key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_nat_gateway.nat-gateway-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_nat_gateway.nat-gateway-2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.privada1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.privada2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.publica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.privada1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.privada2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.publica1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.publica2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.allow_monitor](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.allow_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.sg_wordpress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_subnet.privada1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.privada2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.publica1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.publica2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

Aqui estão as informações completas com os valores preenchidos conforme especificado:

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allo_stora"></a> [allo\_stora](#input\_allo\_stora) | Espaço de armazenamento alocado | `any` | 10 | yes |
| <a name="input_ami_image"></a> [ami\_image](#input\_ami_image) | ID da AMI para as instâncias | `any` | "ami-04505e74c0741db8d" | yes |
| <a name="input_cidr_privada1"></a> [cidr\_privada1](#input\_cidr\_privada1) | Endereço CIDR da primeira subnet privada | `any` | "10.0.1.0/24" | yes |
| <a name="input_cidr_privada2"></a> [cidr\_privada2](#input\_cidr\_privada2) | Endereço CIDR da segunda subnet privada | `any` | "10.0.2.0/24" | yes |
| <a name="input_cidr_publica1"></a> [cidr\_publica1](#input\_cidr\_publica1) | Endereço CIDR da primeira subnet pública | `any` | "10.0.3.0/24" | yes |
| <a name="input_cidr_publica2"></a> [cidr\_publica2](#input\_cidr\_publica2) | Endereço CIDR da segunda subnet pública | `any` | "10.0.4.0/24" | yes |
| <a name="input_classinstance"></a> [classinstance](#input\_classinstance) | Classe da instância do banco de dados | `any` | "db.t3.micro" | yes |
| <a name="input_dbname"></a> [dbname](#input\_dbname) | Nome do banco de dados | `any` | "wordpress_db" | yes |
| <a name="input_engine"></a> [engine](#input\_engine) | Engine do banco de dados | `any` | "mysql" | yes |
| <a name="input_nome_privada1"></a> [nome\_privada1](#input\_nome\_privada1) | Nome da primeira subnet privada | `any` | "sub-privada1" | yes |
| <a name="input_nome_privada2"></a> [nome\_privada2](#input\_nome\_privada2) | Nome da segunda subnet privada | `any` | "sub-privada2" | yes |
| <a name="input_nome_publica1"></a> [nome\_publica1](#input\_nome\_publica1) | Nome da primeira subnet pública | `any` | "sub-publica1" | yes |
| <a name="input_nome_publica2"></a> [nome\_publica2](#input\_nome\_publica2) | Nome da segunda subnet pública | `any` | "sub-publica2" | yes |
| <a name="input_parameter_group_name"></a> [parameter\_group\_name](#input\_parameter\_group_name) | Nome do grupo de parâmetros do banco de dados | `any` | "default.mysql8.0" | yes |
| <a name="input_password"></a> [password](#input\_password) | Senha do banco de dados | `any` | "opsganhei;" | yes |
| <a name="input_port"></a> [port](#input\_port) | Porta do banco de dados | `any` | 3306 | yes |
| <a name="input_region"></a> [region](#input\_region) | A região AWS a ser utilizada | `string` | `"us-east-1"` | no |
| <a name="input_type_instance"></a> [type\_instance](#input\_type\_instance) | Tipo da instância EC2 | `any` | "t2.medium" | yes |
| <a name="input_user"></a> [user](#input\_user) | Usuário do banco de dados | `any` | "alexandrep" | yes |
| <a name="input_v_engine"></a> [v\_engine](#input\_v_engine) | Versão da engine do banco de dados | `any` | "8.0" | yes |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc_cidr) | Endereço CIDR da VPC | `any` | "10.0.0.0/16" | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc_name) | Nome da VPC | `any` | "main-vpc" | yes |

## Outputs

No outputs.
