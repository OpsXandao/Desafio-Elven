resource "aws_key_pair" "key_pair" {
  key_name   = "terraformed-key"
  public_key = file("/home/opsganhei/.ssh/id_ed25519.pub")
}


#   Declarar a Instância EC2
resource "aws_instance" "wordpress_server" {
  ami                         = var.ami_image
  instance_type               = var.type_instance
  subnet_id                   = aws_subnet.publica1.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.sg_wordpress.id]

  user_data = templatefile("ec2Wordpress.sh",
    {
      wp_db_name       = aws_db_instance.bd_wordpress.db_name
      wp_username      = aws_db_instance.bd_wordpress.username
      wp_user_password = aws_db_instance.bd_wordpress.password
      wp_db_host       = aws_db_instance.bd_wordpress.address
  })

  tags = {
    Name = "Wordpress Server"
  }
}

resource "aws_instance" "monitoring_server" {
  ami                         = var.ami_image
  instance_type               = var.type_instance
  subnet_id                   = aws_subnet.publica1.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.allow_monitor.id]
  user_data                   = base64encode(templatefile("ec2Monitor_config.sh", {}))

  tags = merge(local.common_tags, {
    Name = "Monitor Machine"
  })
}
