#
# Cookbook:: docker_monitor
# Recipe:: cadvisor_install
#
# Copyright:: 2020, The Authors, All Rights Reserved.

docker_image 'cadvisor' do
  repo    'gcr.io/cadvisor/cadvisor'
  tag     node['docker_monitor']['cadvisor']['version']
end

docker_container 'cadvisor' do
  repo            'gcr.io/cadvisor/cadvisor'
  tag             node['docker_monitor']['cadvisor']['version']
  restart_policy  'always'
  port            "#{node['docker_monitor']['listen_address']}:8080:8080"
  volumes         %w(/:/rootfs:ro /var/run:/var/run:rw /sys:/sys:ro /var/lib/docker/:/var/lib/docker:ro)
end
