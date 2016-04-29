# A microservices insfrastruture customized for AWS Linux distribution.

![Microservices infrastructure](https://raw.githubusercontent.com/WUMUXIAN/microservices-infra/master/screenshots/Microservices%20infrastructure.png)

# Components
- Mesos - Resource manager and scheduler for the cluster
- Consul - Service Discovery and distributed K/V store
- Dnsmasq - DNS service
- Weave - Multi-host docker container networking
- Treafik - Reverse proxy and load balancer
- Collected - Metrix collection
- Elasticsearch - Store metrix and logs
- Logstash - Forward logs and metrix to elasticsearch
- Kibana - Elasticsearch visualization tool
