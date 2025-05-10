ami                    = "ami-04681163a08179f28"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-0a2b79b94d4b38288"]
subnet_id              = "subnet-0034c59563dfabecd"
iam_instance_profile   = "shared-ec2-role-profile"
key_name               = "Mayur_Key_Pair"
name                   = "app-ec2"
project_name           = "application"
env                    = "NonProd::DEV"
user_data              = " "
root_size              = 30
ebs_size               = 50
ebs_size_extra         = 0
ebs_volume_type        = "gp3"
tags = {
  Owner       = "DevOps"
  Environment = "development"
  Team        = "AppTeam"
}


