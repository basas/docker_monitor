#
# Cookbook:: docker_monitor
# Recipe:: node_exporter_install
#
# Copyright:: 2020, The Authors, All Rights Reserved.

directory '/etc/opt/docker/prometheus' do
  mode    '0755'
end

directory '/opt/prometheus' do
  mode    '0777'
end

template '/etc/opt/docker/prometheus/prometheus.yml' do
  source    'prometheus.erb'
  mode      '0755'
  notifies  :restart, 'docker_container[prometheus]', :delayed
end

docker_image 'prometheus' do
  repo    'prom/prometheus'
  tag     node['docker_monitor']['prometheus']['version']
end

docker_container 'prometheus' do
  repo            'prom/prometheus'
  tag             node['docker_monitor']['prometheus']['version']
  restart_policy  'always'
  port            "#{node['docker_monitor']['listen_address']}:9090:9090"
  volumes         %w(/etc/opt/docker/prometheus/:/etc/prometheus/ \
                  /opt/prometheus:/prometheus)
end
