resource "tls_private_key" "linux_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create an AWS key pair using the generated public key
resource "aws_key_pair" "linux_key" {
  key_name   = "linux-prod"
  public_key = tls_private_key.linux_key.public_key_openssh
}
