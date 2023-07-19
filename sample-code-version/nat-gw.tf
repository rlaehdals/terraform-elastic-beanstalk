module "nat-gw" {
  source           = "github.com/rlaehdals/terraform-archive/nat-gw"
  dev_public_1_id  = module.subnets.public-subnet-1-id
  vpc_id           = module.vpc.vpc-id
  dev_private_1_id = module.subnets.private-subnet-1-id
  dev_private_2_id = module.subnets.private-subnet-2-id
  dev_private_3_id = module.subnets.private-subnet-3-id
  tags = var.tags
}
