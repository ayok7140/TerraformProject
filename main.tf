provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "core_demo" {
  bucket = var.bucket_name


  tags = {
    Name        = "tf-${terraform.workspace}-core-demo"
    Environment = terraform.workspace
  }
}

# network module Phase 2 (add)
module "network" {
  source = "./modules/network"

  name                 = "tf-${terraform.workspace}"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  azs                  = var.azs

  tags = {
    Name        = "tf-${terraform.workspace}-core-demo"
    Environment = terraform.workspace
  }
}

# compute module
module "compute" {
  source = "./modules/compute"

  name               = "tf-${terraform.workspace}"
  vpc_id             = module.network.vpc_id
  public_subnet_ids  = module.network.public_subnet_ids
  private_subnet_ids = module.network.private_subnet_ids

  instance_type    = var.instance_type
  desired_capacity = var.desired_capacity
  min_size         = var.min_size
  max_size         = var.max_size

  tags = {
    Name        = "tf-${terraform.workspace}-compute"
    Environment = terraform.workspace
  }
}

