# Security group for private ec2 instances
module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1" 

  name = "private_sg"
  description = "security group with http & ssh port open for entire VPC Block(IPv4 CIDR), egress ports already open"
  vpc_id = module.vpc.vpc_id
# Ingress rules and cidr blocks
ingress_rules = ["ssh-tcp", "http-80-tcp"]
ingress_cidr_blocks = [module.vpc.vpc_cidr_block]
# egress rule - all-all open
egress_rules = ["all-all"]
tags = local.common_tags
}
