
module "vpc" {
  source = "github.com/insight-icon/terraform-icon-monitor-aws-network.git?ref=master"
}

module "defaults" {
  source         = "../.."
  security_group = module.vpc.rds_security_group_id
  subnet_ids     = module.vpc.public_subnets
}
