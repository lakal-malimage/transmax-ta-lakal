#terraform {
#  backend "s3" {
#    bucket         = "dev-tfstate-trnsmx"
#    dynamodb_table = "dev-tf-trnsmx-lock"
#    encrypt        = true
#    key            = "trnsmx/dev/terraform.tfstate"
#    profile        = "lakal_private"
#    region         = "us-east-1"
#  }
#}
