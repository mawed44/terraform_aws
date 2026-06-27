output "ec2_public_ip" {
  description = "L'adresse IP publique de l'instance EC2"
  value       = aws_instance.web_server.public_ip
}

output "vpc_id" {
  description = "L'ID du VPC crée"
  value       = aws_vpc.main.id
}