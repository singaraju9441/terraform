provider "aws" {
  region = "us-east-1"
  
}

resource "aws_instance" "santhosh" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id = "subnet-09cc03314b559164a"

}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "santhosh-s3bucket-338"
  
}

/* resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}*/