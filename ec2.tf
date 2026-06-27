# Récupération dynamique dernière AMI Ubuntu 22.04 LTS disponible
data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Identifiant officiel de Canonical (Ubuntu)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# Création instance EC2
resource "aws_instance" "web_server" {
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  # Script de démarrage pour installer Nginx automatiquement
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install nginx -y
              systemctl start nginx
              systemctl enable nginx
              echo "<h1>Infrastructure AWS via Terraform et GitOps !</h1>" > /var/www/html/index.html
              EOF

  tags = {
    Name = "${var.project_name}-ec2-server"
  }
}