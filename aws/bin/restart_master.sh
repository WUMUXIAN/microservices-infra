#!/bin/bash
cd ..
ansible mesos-master -m command -b -a "/sbin/restart mesos-master"
ansible mesos -m service -b -a "name=nginx-consul state=restarted"
ansible mesos -m service -b -a "name=weave state=restarted"
ansible mesos -m service -b -a "name=weaveproxy state=restarted"
cd bin
