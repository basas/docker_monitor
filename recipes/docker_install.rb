#
# Cookbook:: docker_monitor
# Recipe:: docker_install
#
# Copyright:: 2020, The Authors, All Rights Reserved.

#docker_service 'default' do
#  install_method  'tarball'
#  version         node['docker_monitor']['docker']['version']
#  action          [:create, :start]
#end
yum_package 'docker' do
    action :install
end

service 'docker' do
    action :start
end

# dir for volumes
directory '/etc/opt/docker' do
  mode    '0755'
end
