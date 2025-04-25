provider "aws" {
  region = "us-east-1"
  
}
provider "vault" {
  address = "http://13.49.69.197:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "badb95bc-3fd5-888e-4e5d-49d158282643"
      secret_id = "6f4c3fad-0ba8-2a7e-b3ab-32b794c26f3d"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

output "vault_data" {
  value     = data.vault_kv_secret_v2.example.data
  sensitive = true
}


resource "aws_instance" "example" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"

  tags = {
    Name = "vault-instance"
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
  
}

resource "aws_s3_bucket" "example" {
  bucket = "santhosh338thanu"
  

  tags = {
    Name = "vault-s3-bucket"
    secret = data.vault_kv_secret_v2.example.data["username"]
  }
  
}
