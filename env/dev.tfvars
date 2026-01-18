bucket_name = "ak-tf-dev-core-001"
region      = "us-east-1"

# dev network resource values
vpc_cidr = "10.10.0.0/16"

public_subnet_cidrs  = ["10.10.1.0/24", "10.10.2.0/24"]
private_subnet_cidrs = ["10.10.11.0/24", "10.10.12.0/24"]

azs = ["us-east-1a", "us-east-1b"]

# compute resource values
instance_type    = "t3.micro"
desired_capacity = 2
min_size         = 2
max_size         = 3

