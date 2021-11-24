terraform {
    backend "s3" {
    bucket = "achterrafrom"
    key    = "team/dev"
    region = "us-east-1"
  }
   required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.62.0"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"

}

resource "aws_instance" "app_server" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.deployer.key_name}"
  vpc_security_group_ids = [aws_security_group.cloud_int.id]
  


  tags = {
    Name = "ach-terra"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "your public key"
}

output "instance_ip_addr" {
  value = aws_instance.app_server.public_ip
}
