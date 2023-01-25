# AWS EC2 Instance terraform module
# EC2 Instances that will be created in VPC Private subnets
module "ec2_private" {
  depends_on = [ module.vpc ]
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.3.0"

# insert the 10 required variables here
  name = "${var.environment}-vm"
  ami                    = data.aws_ami.amzlinux2.id
  instance_type          = var.instance_type
  key_name               = var.instance_keypair
  #monitoring             = true
  vpc_security_group_ids = [module.private_sg.security_group_id]
  #subnet_id              = module.vpc.public_subnets[0]
  subnet_id = [
    module.vpc.private_subnets[0],
    module.vpc.private_subnets[1]]
  #count = 3
  user_data = file("${path.module}/app1.install.sh")
  tags = local.common_tags
}