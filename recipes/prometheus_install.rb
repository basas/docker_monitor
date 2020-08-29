#
# Cookbook:: docker_monitor
# Recipe:: node_exporter_install
#
# Copyright:: 2020, The Authors, All Rights Reserved.

directory '/etc/opt/docker/prometheus' do
  mode    '0755'
  action  :create
end

directory '/opt/prometheus' do
  mode    '0777'
  action  :create
end

template '/etc/opt/docker/prometheus/prometheus.yml' do
  source    'prometheus.erb'
  mode      '0755'
  notifies  :run, 'execute[prometheus_restart]', :delayed
end

execute 'prometheus_restart' do
  command 'docker restart prometheus'
  action  :nothing
end

docker_image 'prometheus' do
  repo    'prom/prometheus'
  tag     node['docker_monitor']['prometheus']['version']
  action  :pull
end

docker_container 'prometheus' do
  repo            'prom/prometheus'
  tag             node['docker_monitor']['prometheus']['version']
  restart_policy  'always'
  port            "#{node['docker_monitor']['listen_address']}:9090:9090"
  volumes         ['/etc/opt/docker/prometheus/:/etc/prometheus/',\
                   '/opt/prometheus:/prometheus']
  action          :run
end
