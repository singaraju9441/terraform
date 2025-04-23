terraform {
  backend "s3" {
    bucket         = "your-terraform-bucket"
    key            = "terraform.tfstate"
    region         = "your-region"
    dynamodb_table = "terraform-locks"
  }
}