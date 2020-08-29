# Attributes
# default['docker_monitor']['listen_address'] = '127.0.0.1'
default['docker_monitor']['listen_address'] = node['ipaddress']

default['docker_monitor']['docker']['version'] = '19.03.12'

default['docker_monitor']['cadvisor']['version'] = 'v0.36.0'

default['docker_monitor']['grafana']['version'] = '7.1.5'

default['docker_monitor']['prometheus']['version'] = 'v2.20.1'
