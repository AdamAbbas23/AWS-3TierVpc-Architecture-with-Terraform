# AWS EC2 Instance Terraform Outputs
# Public EC2 Instances -bastion Host

## ec2_bastion_public_instance_ids
output "ec2_bastion_public_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}

## ec2_bastion_public_ip
output "ec2_bastion_public_ip" {
  description = "The public IP names assigned to the instance."
  value       = module.ec2_public.public_ip
}

# Private EC2 Instances
## ec2_private_instance_ids
output "ec2_private_instance_ids" {
  description = "The ID of the instance"
  value       = module.ec2_public.id
}
## ec2_private_ip
output "ec2_private_ip" {
  description = "The private IP addresses assigned to the instance."
  value       = module.ec2_private.private_ip
}
