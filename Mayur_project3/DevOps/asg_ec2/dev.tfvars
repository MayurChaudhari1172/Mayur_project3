name_prefix          = "student-app"
ami_id               = "ami-0554aa6767e249943"
instance_type        = "t2.micro"
key_name             = "Key-Pair-Punam"
iam_instance_profile = "fqts-proj3-iam-role-profile"

security_group_ids = ["sg-0c7eb9f00f0d010bc"]
subnet_ids         = ["subnet-0240a86a8ee3c206d", "subnet-0eae2211a022cebd2"]
target_group_arns  = ["arn:aws:elasticloadbalancing:us-east-1:183295447311:targetgroup/FQTS-tg/f229be882c1455f4"]

desired_capacity = 0
min_size         = 0
max_size         = 2

scale_up_cpu_threshold   = 70
scale_up_adjustment      = 1
scale_down_cpu_threshold = 20

tags = {
  "Environment" = "dev"
  "Project"     = "StudentApp"
}

mysql_root_password = "Admin@123"
tomcat_version      = "10.1.24"
war_name            = "student-rest-api.war"
war_url             = "https://new-mayur-devops-bucket-fqts.s3.amazonaws.com/app/student-rest-api.war"
