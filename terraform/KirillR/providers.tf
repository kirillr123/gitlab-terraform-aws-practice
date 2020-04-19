provider "aws" {
  region                  = "us-east-1"
  profile                 = "default"
}

terraform {
  backend "s3" {
    bucket = "tfstate-bucket-123"
    key    = "terraformhw/terraform.tfstate"
    region = "us-east-1"
  }

}
