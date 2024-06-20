resource "aws_key_pair" "key_pair" {
  key_name   = "terraformed-key"
  public_key = file("~/.ssh/id_rsa.pub")
}


#   Declarar a Instância EC2
resource "aws_instance" "wordpress_server" {
  ami                         = var.ami_image
  instance_type               = var.type_instance
  subnet_id                   = aws_subnet.main.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.key_pair.key_name
  vpc_security_group_ids      = [aws_security_group.sg_wordpress.id]

  tags = {
    Name = "Wordpress Server"
  }
}

/*resource "aws_instance" "monitoring_server"{
    ami = var.ami_image
    instance_type = var.type_instance
    subnet_id = aws_subnet.main.id
    associate_public_ip_address = true
    key_name = aws_key_pair.key_pair.key_name
    vpc_security_group_ids = 
}*/
