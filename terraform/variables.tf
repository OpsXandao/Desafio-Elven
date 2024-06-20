  variable "region" {
    default = "us-east-1"
  }
  
  # Variáveis da VPC
  
  variable "vpc_cidr" {
    description = "Endereço da VPC"
  }
  variable "vpc_name" {}
  variable "cidr_privada1" {}
  variable "cidr_privada2" {}
  variable "cidr_publica1" {}
  variable "cidr_publica2" {}
  variable "nome_privada1" {}
  variable "nome_privada2" {}
  variable "nome_publica1" {}
  variable "nome_publica2" {}

# Variáveis do EC2

variable "ami_image" {}
variable "type_instance" {}

# Variáveis BD

variable "allo_stora" {
  description = "Irá alocar espaço de armazenamento"
}

variable "dbname" {}

variable "engine" {
  description = "Engine do Banco"
}

variable "v_engine" {
  description = "Versão da engine do Banco"
}

variable "classinstance" {}

variable "user" {
  description = "user do Banco"
}

variable "password" {
  description = "Senha do Banco"
}

variable "parameter_group_name" {}

variable "port" {}