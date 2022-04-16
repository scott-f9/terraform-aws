provider "aws" {
  region = element(var.region, 0)
}


module "VPC-Module" { 
  source = "./VPC-Module"
}


module "SG-Module" { 
  source = "./SG-Module"
  vpc_id = module.VPC-Module.vpc_id
}

module "EC2-Module" { 
  source = "./EC2-Module"
  public_subnet_id = module.VPC-Module.public_subnet_id
  private_subnet_id = module.VPC-Module.private_subnet_id
  sg_id = module.SG-Module.sg_id
  vpc_id = module.VPC-Module.vpc_id
}
