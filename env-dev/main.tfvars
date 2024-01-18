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
account_id             = "633788536644"
default_vpc_id         = "vpc-0a8e3e6a0d6cb90d9"
default_route_table_id = "rtb-0b9a867762d6530ba"
default_vpc_cidr       = "172.31.0.0/16"