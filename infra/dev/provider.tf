provider "aws" {
  region = "us-east-1"
  profile = "lakal_private"
  default_tags {
    tags = {
      Environment = "dev"
      Terraform     = "true"
    }
  }
}

