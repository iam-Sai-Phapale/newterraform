terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
}
variable region {
  default = "ap-south-1"
}
resource "aws_instance" "web" {
  ami           = "ami-03bb6d83c60fc5f7c"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
terraform {
  backend "s3" {
    bucket = "terraform-server-b16"
    key    = "terrafromstate"
    region = "ap-south-1"
    dynamodb_table  = "terraform-test"
  }
}
