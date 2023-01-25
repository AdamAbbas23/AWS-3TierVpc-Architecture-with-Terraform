# Security group for public bastion host
module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.17.1" 

  name = "public-bastion-sg"
  description = "security group with ssh port open for everybody (IPv4 CIDR), egress ports already open"
  vpc_id = module.vpc.vpc_id
# Ingress rules and cidr blocks
ingress_rules = ["ssh-tcp"]
ingress_cidr_blocks = ["0.0.0.0/0"]
# egress rule - all-all open
egress_rules = ["all-all"]
tags = local.common_tags
}
