#
# Cookbook:: docker_monitor
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'docker_monitor::docker_install'
include_recipe 'docker_monitor::node_exporter_install'
include_recipe 'docker_monitor::cadvisor_install'
include_recipe 'docker_monitor::prometheus_install'
include_recipe 'docker_monitor::grafana_install'
