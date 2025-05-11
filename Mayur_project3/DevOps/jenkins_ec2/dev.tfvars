ami                    = "ami-04681163a08179f28"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-0a2b79b94d4b38288"]
key_name               = "Mayur_Key_Pair"
subnet_id              = "subnet-0034c59563dfabecd"
iam_instance_profile   = "fqts-proj3-iam-role-profile"
name                   = "jenkins-ec2"
project_name           = "DevOps"
env                    = "dev"
user_data              = <<-EOF
  #!/bin/bash
  sudo yum update -y

  # Install Java 17 (Amazon Corretto)
  sudo amazon-linux-extras enable corretto17
  sudo yum install -y java-17-amazon-corretto

  # Install Jenkins
  wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
  sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
  sudo yum install -y jenkins

  # Enable and start Jenkins
  sudo systemctl enable jenkins
  sudo systemctl start jenkins
EOF
