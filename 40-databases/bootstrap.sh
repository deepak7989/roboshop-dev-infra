#!/bin/bash

<<<<<<< Updated upstream
component=$1 # mongodb
environment=$2 # dev
dnf install ansible -y
mkdir -p /var/log/roboshop/
chown -R ec2-user:ec2-user /var/log/roboshop
chmod -R 755 /var/log/roboshop
touch /var/log/roboshop/ansible.log
=======
component=$1
environment=$2
>>>>>>> Stashed changes

dnf install ansible git -y

mkdir -p /var/log/roboshop/
touch /var/log/roboshop/ansible.log
chown -R ec2-user:ec2-user /var/log/roboshop
chmod -R 755 /var/log/roboshop

ANSIBLE_DIR=/home/ec2-user/roboshop-ansible-v3

sudo -u ec2-user git -C "$ANSIBLE_DIR" pull origin main

sudo -u ec2-user env ANSIBLE_CONFIG="$ANSIBLE_DIR/ansible.cfg" ansible-playbook \
  -e component="$component" \
  -e env="$environment" \
  "$ANSIBLE_DIR/roboshop.yaml"
