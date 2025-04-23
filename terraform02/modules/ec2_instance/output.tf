output "public-ip-address" {
  value = aws_instance.terraform.public_ip
}