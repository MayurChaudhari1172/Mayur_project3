ami                    = "ami-0953476d60561c955"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-0c7eb9f00f0d010bc"]
key_name               = "Key-Pair-Punam"
subnet_id              = "subnet-0240a86a8ee3c206d"
iam_instance_profile   = "fqts-proj3-iam-role-profile"
name                   = "terraform-ec2"
project_name           = "DevOps"
env                    = "dev"
user_data              = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install -y wget unzip
    wget https://releases.hashicorp.com/terraform/1.6.6/terraform_1.6.6_linux_amd64.zip
    unzip terraform_1.6.6_linux_amd64.zip
    sudo mv terraform /usr/local/bin/
    terraform -version
  EOF
