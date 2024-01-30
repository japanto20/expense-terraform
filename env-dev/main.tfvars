vpc_cidr_block = "10.10.0.0/16"
env            = "dev"
tags = {
  company      = "ANTO Co"
  bu_unit      = "Finance"
  project_name = "expense"
}

public_subnets = ["10.10.0.0/24", "10.10.1.0/24"]
web_subnets    = ["10.10.2.0/24", "10.10.3.0/24"]
app_subnets    = ["10.10.4.0/24", "10.10.5.0/24"]
db_subnets     = ["10.10.6.0/24", "10.10.7.0/24"]

azs                    = ["us-east-1a", "us-east-1b"]
account_id             = "484704032921"
default_vpc_id         = "vpc-0e95309b0d91afcf9"
default_route_table_id = "rtb-00130c94290ba5abc"
default_vpc_cidr       = "172.31.0.0/16"

rds_allocated_storage = 20
rds_engine            = "mysql"
rds_engine_version    = "5.7.44"
rds_instance_class    = "db.t3.micro"
