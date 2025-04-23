
provider "aws" {
  region = "us-east-1"
  
}

resource "aws_instance" "terraform" {
  ami           = var.ami_value  # Use the variable for AMI ID
  instance_type = var.instance_type_value  # Use the variable for instance type

  tags = {
    Name = "TerraformInstance"
  }
  
}