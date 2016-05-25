#!/bin/bash
cd ..
ansible-playbook -vv restart_slaves.yml
cd bin
