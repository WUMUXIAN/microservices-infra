#!/bin/bash

cd ..
if [[ $# == 0 ]]; then
    echo "Usage:
            . restart_marathon.sh --maintain                Restart marathon with the jobs maintained
            . restart_marathon.sh --purge framework_id      Restart marathon as a new framework with the jobs purged"
else
    if [[ $# == 2 ]] && [[ "$1" == "--purge" ]]; then
	    postBody=`echo frameworkId=$2`
	    echo $postBody
        ansible mesos-master -m command -b -a "/sbin/stop marathon"
        ansible mesos-master1 -m command -b -a "/usr/lib/zookeeper/bin/zkCli.sh rmr /marathon"
        ansible mesos-master1 -m uri -b -a "body='$postBody' method=POST url=http://leader.mesos.service.consul:5050/master/teardown"
        ansible mesos-master -m command -b -a "/sbin/start marathon"
    fi	
fi
cd bin
