resource "aws_security_group" "web_sg" {
  name        = "${var.project_name}-web-sg"
  description = "Autoriser le trafic HTTP et SSH entrant"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # AWS-0107 : Documentation exception pour le lab d'outils d'administration ouverts
  #trivy:ignore:aws-security-group-no-public-ingress-sgr
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # AWS-0104 : Documentation pourquoi la machine doit sortir sur Internet (mises a jour apt/nginx)
  #trivy:ignore:aws-security-group-no-public-egress-sgr
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}