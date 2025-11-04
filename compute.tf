resource "aws_instance" "jenkins_server" {
  ami                         = "ami-0bdd88bd06d16ba03" #Linux
  instance_type               = var.ec2_instance_type
  subnet_id                   = aws_subnet.public_subnet[0].id
  vpc_security_group_ids      = [aws_security_group.linux_sg.id]
  key_name                    = aws_key_pair.linux_key.key_name
  monitoring                  = true
  root_block_device {
    delete_on_termination = true
    volume_size           = var.ec2_volume_config.size
    volume_type           = var.ec2_volume_config.type

  }
  lifecycle {
    create_before_destroy = true
  }

  tags = merge(local.common_tags, {
    Name = "linux-Server"

  })
}