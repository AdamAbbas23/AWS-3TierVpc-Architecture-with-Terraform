# create elastic ip for bastion host
# resource - depends on meta-arguement

resource "aws_eip" "bastion_eip" {
  depends_on = [module.ec2_public, module.vpc]
  instance = module.ec2_public.id
  vpc      = true
  tags = local.common_tags

  # Local Exec Provisioner:  local-exec provisioner
  #provisioner "local-exec" {
    #command = "echo destroy time prov date" > destroy-time-prov.txt
    #working_dir = "local-exec-output-files/"
    #when = destroy
    #on_failure = continue
  #}
}
