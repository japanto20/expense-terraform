module "vpc" {
  source                 = "./modules/vpc"
  vpc_cidr_block         = var.vpc_cidr_block
  env                    = var.env
  tags                   = var.tags
  public_subnets         = var.public_subnets
  web_subnets            = var.web_subnets
  app_subnets            = var.app_subnets
  db_subnets             = var.db_subnets
  azs                    = var.azs
  account_id             = var.account_id
  default_vpc_id         = var.default_vpc_id
  default_route_table_id = var.default_route_table_id
  default_vpc_cidr       = var.default_vpc_cidr
}

module "rds" {
  source                = "./modules/rds"
  subnets               = module.vpc.db_subnets
  env                   = var.env
  rds_allocated_storage = var.rds_allocated_storage
  rds_engine            = var.rds_engine
  rds_engine_version    = var.rds_engine_version
  rds_instance_class    = var.rds_instance_class
  sg_cidrs              = var.app_subnets
  tags                  = var.tags
  vpc_id                = module.vpc.vpc_id
}

module "backend" {
  source         = "./modules/app"
  app_port       = var.backend["app_port"]
  component      = "backend"
  env            = var.env
  instance_count = var.backend["instance_count"]
  instance_type  = var.backend["instance_type"]
  sg_cidrs       = var.web_subnets
  subnets        = module.vpc.app_subnets
  tags           = var.tags
  vpc_id         = module.vpc.vpc_id
  bastion_cidrs  = var.bastion_cidrs
}

module "frontend" {
  source         = "./modules/app"
  app_port       = var.frontend["app_port"]
  component      = "frontend"
  env            = var.env
  instance_count = var.frontend["instance_count"]
  instance_type  = var.frontend["instance_type"]
  sg_cidrs       = var.public_subnets
  subnets        = module.vpc.web_subnets
  tags           = var.tags
  vpc_id         = module.vpc.vpc_id
  bastion_cidrs  = var.bastion_cidrs
}