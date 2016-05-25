#!/bin/bash

cd ..
if [[ $# == 0 ]]; then
    echo "Usage:
            . restart_chronos.sh --maintain                Restart chronos with the jobs maintained
            . restart_chronos.sh --purge framework_id      Restart chronos as a new framework with the jobs purged"
else
    ansible mesos-master1 -m pip -b -a "executable=/usr/local/bin/pip name=httplib2 state=present"
    ansible mesos-master1 -m uri -b -a "url=http://localhost:8080/v2/apps/chronos method=DELETE HEADER_Content-Type='application/json'"
    if [[ $# == 2 ]] && [[ "$1" == "--purge" ]]; then
	    postBody=`echo frameworkId=$2`
	    echo $postBody
        ansible mesos-master1 -m command -b -a "/usr/lib/zookeeper/bin/zkCli.sh rmr /chronos"
        ansible mesos-master1 -m uri -b -a "body='$postBody' method=POST url=http://leader.mesos.service.consul:5050/master/teardown"
    fi
	ansible-playbook -vv infra.yml --tags "chronos"
fi
cd bin
