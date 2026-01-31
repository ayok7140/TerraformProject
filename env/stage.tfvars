bucket_name = "ak-tf-stage-core-001"
region      = "us-east-1"

# stage network resource values
vpc_cidr = "10.20.0.0/16"

public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
private_subnet_cidrs = ["10.20.11.0/24", "10.20.12.0/24"]

azs = ["us-east-1a", "us-east-1b"]

instance_type    = "t3.micro"
desired_capacity = 2
min_size         = 2
max_size         = 3
