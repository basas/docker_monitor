#
# Cookbook:: docker_monitor
# Recipe:: docker_install
#
# Copyright:: 2020, The Authors, All Rights Reserved.

docker_service 'default' do
  install_method  'package'
  version         node['docker_monitor']['docker']['version']
  action          [:create, :start]
end

# dir for volumes
directory '/etc/opt/docker' do
  mode    '0755'
  action  :create
end
