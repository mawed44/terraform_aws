terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  # Stockage distant et sécurisé du State
  backend "s3" {
    bucket         = "mf-iac-terraform-aws"
    key            = "state/terraform.tfstate"
    region         = "eu-west-3"                       # Paris
    dynamodb_table = "terraform-state-lock"            # Table pour le verrouillage
    encrypt        = true                              # Chiffrement du fichier d'état
  }
}

provider "aws" {
  region = var.aws_region
}