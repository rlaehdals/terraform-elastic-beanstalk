module internet-gw {
  source = "github.com/rlaehdals/terraform-archive/internet-gw"
  vpc_id = module.vpc.vpc-id
  tags = var.tags
  public_1_subnet_id = module.subnets.public-subnet-1-id
  public_2_subnet_id = module.subnets.public-subnet-2-id
  public_3_subnet_id = module.subnets.public-subnet-3-id
}
