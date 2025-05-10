ami                    = "ami-04681163a08179f28"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-0a2b79b94d4b38288"]
key_name               = "Mayur_Key_Pair"
subnet_id              = "subnet-0034c59563dfabecd"
iam_instance_profile   = "shared-ec2-role-profile"
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
