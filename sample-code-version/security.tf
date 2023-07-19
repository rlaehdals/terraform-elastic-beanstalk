module "ssh_security_group" {
  source = "github.com/rlaehdals/terraform-archive/security_group"

  vpc_id = module.vpc.vpc-id

  security_name = var.security_name

  ingress = var.ingress

  cidr_blocks = var.cidr_blocks

  protocol = var.protocol

  region = var.region

  tags = var.tags
}