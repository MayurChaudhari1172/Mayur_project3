ami                    = "ami-0953476d60561c955"
instance_type          = "t2.micro"
vpc_security_group_ids = ["sg-0c7eb9f00f0d010bc"]
key_name               = "Key-Pair-Punam"
subnet_id              = "subnet-0240a86a8ee3c206d"
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
