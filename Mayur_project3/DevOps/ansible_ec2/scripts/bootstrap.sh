#!/bin/bash

# Redirect output to log
exec > /var/log/ansible-setup.log 2>&1
set -eux

echo ">>> Initial system update"
yum update -y
yum clean metadata

echo ">>> Enable EPEL repository"
amazon-linux-extras enable epel -y
yum install -y epel-release

echo ">>> Install Python 3 and Ansible"
yum install -y python3 ansible

# Check versions
python3 --version
ansible --version

echo ">>> Create ansadmin user and generate SSH keys"
useradd -m ansadmin
mkdir -p /home/ansadmin/.ssh
chmod 700 /home/ansadmin/.ssh

# Generate SSH keypair for ansadmin
ssh-keygen -t rsa -b 2048 -f /home/ansadmin/.ssh/id_rsa -q -N ""
cp /home/ansadmin/.ssh/id_rsa.pub /home/ansadmin/.ssh/authorized_keys

# Set permissions
chmod 600 /home/ansadmin/.ssh/id_rsa
chmod 600 /home/ansadmin/.ssh/authorized_keys
chown -R ansadmin:ansadmin /home/ansadmin

echo ">>> Configure passwordless sudo for ansadmin"
echo "ansadmin ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/ansadmin
chmod 440 /etc/sudoers.d/ansadmin

echo "✅ Ansible control node setup complete" > /home/ansadmin/ready.txt
chown ansadmin:ansadmin /home/ansadmin/ready.txt

echo ">>> Final update to apply remaining security patches"
yum update -y
