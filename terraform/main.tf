#backend
terraform {
  backend "s3" {
    bucket         = "kubeforge-tf-state"
    key            = "global/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

#VPC
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr = "10.0.0.0/16"

  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.11.0/24", "10.0.12.0/24"]

  azs = ["ap-south-1a", "ap-south-1b"]
}

#iam
module "iam" {
  source = "./modules/iam"

  cluster_name = "kubeforge"
}

#eks
module "eks" {
  source = "./modules/eks"

  cluster_name       = "kubeforge"
  subnet_ids         = module.vpc.private_subnet_ids
  cluster_role_arn   = module.iam.eks_cluster_role_arn
  node_role_arn      = module.iam.eks_node_role_arn
}
