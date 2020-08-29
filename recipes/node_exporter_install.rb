#
# Cookbook:: docker_monitor
# Recipe:: node_exporter_install
#
# Copyright:: 2020, The Authors, All Rights Reserved.

node_exporter 'main' do
  web_listen_address  "#{node['docker_monitor']['listen_address']}:9100"
  action              [:enable, :start]
end
