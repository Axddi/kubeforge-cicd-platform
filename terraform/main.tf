terraform {
  backend "s3" {
    bucket         = "kubeforge-tf-state"
    key            = "global/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
