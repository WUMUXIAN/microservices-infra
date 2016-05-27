#!/bin/bash
cd ..
ansible-playbook -vv remove_old_docker.yml
ansible-playbook -vv infra.yml --tag "docker"
cd bin
