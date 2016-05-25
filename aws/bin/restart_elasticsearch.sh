#!/bin/bash

cd ..
if [[ $# -ne 1 ]]; then
    echo "Please attach the frameworkId of the elasticsearch framework"
else
    ansible-playbook -vv restart_elasticsearch.yml --extra-vars "frameworkId=$1"
fi
cd bin
