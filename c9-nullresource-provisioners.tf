# Create a null resource and provisioners
resource "null_resource" "name" {
    depends_on = [module.ec2_public]
## Connection block for provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    host     = aws_eip.bastion_eip.public_ip
    user     = "ec2-user"
    password = ""
    private_key = file("private-key/terraform-key.pem")
  }
# File Provisioner: Copies terraform-key.pem file to /tmp/terraform.key.pem
  provisioner "file" {
    source      = "/Users/adam/downloads/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
# Remote exec provisioner: using remote-exec provisioner fix the private key permissions on.
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
  ## Local Exec Provisioner:  local-exec provisioner
  provisioner "local-exec" {
    command = "echo VPC created on 'date' and VPC ID: ${module.vpc.vpc_id} >> creation-time-vpc-id.txt"
    working_dir = "local-exec-output-files/"
    on_failure = continue
  }
}

  # Local Exec Provisioner:  local-exec provisioner
  //* provisioner "local-exec" {
 #command = "echo destroy time prov date" > destroy-time-prov.txt
# working_dir = "local-exec-output-files/"
# when = destroy
 #on_failure = continue
  #}
# creation time provisioners - by default they are
# destroy time provisioners - will be executed when terraform destroy command (when = destroy)