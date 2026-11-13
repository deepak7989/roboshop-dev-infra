#!/bin/bash

component=$1   # mongodb / redis
environment=$2 # dev

dnf install ansible git -y

mkdir -p /var/log/roboshop/
touch /var/log/roboshop/ansible.log
chown -R ec2-user:ec2-user /var/log/roboshop
chmod -R 755 /var/log/roboshop

ANSIBLE_DIR=/home/ec2-user/roboshop-ansible-v3
ANSIBLE_REPO=https://github.com/deepak7989/roboshop-ansible-v3.git

if [ -d "$ANSIBLE_DIR/.git" ]; then
  sudo -u ec2-user git -C "$ANSIBLE_DIR" pull origin main
else
  sudo -u ec2-user git clone "$ANSIBLE_REPO" "$ANSIBLE_DIR"
fi

sudo -u ec2-user env ANSIBLE_CONFIG="$ANSIBLE_DIR/ansible.cfg" ansible-playbook \
  -e component="$component" \
  -e env="$environment" \
  "$ANSIBLE_DIR/roboshop.yaml"