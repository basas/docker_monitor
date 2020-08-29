# Docker_monitor Cookbook
-------------------------------------
Installs and configures Docker, Prometheus/node_exporter, cAdvisor, Prometheus and Grafana.

## Requirements

- Chef Infra Client 15 or later

## Platform Support

- CentOS 7

## Cookbook Dependencies

- [docker](https://supermarket.chef.io/cookbooks/docker) - v6.0.3
- [prometheus_exporters](https://supermarket.chef.io/cookbooks/prometheus_exporters) - v0.17.2


# Overview

Cookbook has several recipies which install specific products by executing default recipie.

- docker_install        - installs specific Docker version on the local machine from package
- node_exporter_install - Installs node_exported on the local machine via promotheus_exporters cookbook and listens private network address
- cadvisor_install      - Installs cAdvisor in container, fetch local machine data via docker volumes listening on private network and specic port
- prometheus_install    - Installs Prometheus in container. Puts configuration to collectt data from private network accesible collectors (node_exporter and cadvisor). Configures volumes for data storage.
- grafana_install       - Installs Grafana in container. Puts configuration files to show graphs from prometheus feed. Listens on public network for GUI access. Imports Node_exporter and cadvisor dashboards. Configures admin password and sets default dashboard to node_exporter dashboard.


Cookbook has integration tests:
- Docker installed and runing
- Node_exporter service is runing and listens on port
- Node exporter web console is accessible and healthy
- cAdvisor docker image exists and container runing
- cAdvisor port is listening
- cAdvisor web console is healthy
- Prometheus docker image exists and container runing
- Prometheus port is listening
- Prometheus web console is healthy and ready
- Grafana docker image exists and container runing
- Grafana port is listening
- Grafana web visualization and analytics UI is healthy
