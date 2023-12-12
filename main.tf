module "vpc" {
  source = "./modules/vpc"
}

resource "null_resource" "test" {}