# Intro
This project helps you to provision softwares required for a Microservices infrastructure on your EC2 instances, provided you have already created them
and have access to them.

## Getting Started

**Step 1**: The first step would be to bring up the EC2 instances, this step can be automated using Terraform, but you need to have access to your AWS. Once you
are done with it, download your access key file .pem to the *ec2* folder and name it to *Analytics.pem*. 
**Note: the instances must be accessible to each other through all ports using their private IP**

**Step 2**: Modify the inventory file and put in your paticurlars:
```text
[mesos-master]
mesos-master1
mesos-master2
....
[mesos-slave]
mesos-slave1
mesos-slave2
....
....
[all:children]
mesos-master
mesos-slave
```

**Step 3**: Modify the host variables based on your masters and slaves:
```text
./host_vars/mesos-master1:
---
private_ipv4: 10.11.30.228
./host_vars/mesos-master2:
---
private_ipv4: 10.11.30.229
./host_vars/mesos-slave1:
---
private_ipv4: 10.11.30.230
./host_vars/mesos-slave2:
---
private_ipv4: 10.11.30.231
```

**Step 4**: Once you have your instances up, to configure your working machine to access these nodes without remembering their IPs, run the following command to register them into your /etc/hosts and ~/.ssh/config:
```
ansible-playbook --ask-become-pass -e user_name=$(whoami) local.yml
```

## Provision and deploy
Up to this point, you are ready to spin up the mesos cluster, run the following command to do it:
```
ansible-playbook -v mesos.yml
```
Wait for a few minutes for the ansible playbook to complete and your mesos cluster will be ready to use.
