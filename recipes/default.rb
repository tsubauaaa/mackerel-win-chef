#
# Cookbook Name:: mackerel-win
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
windows_package 'mackerel-agent' do
  source node['mackerel-win']['source']
  installer_type :msi
  options "APIKEY=\"#{node['mackerel-win']['apikey']}\""
  action :install
  not_if { ::File.exist?('C:/Program Files (x86)/Mackerel/mackerel-agent/mackerel-agent.conf') }
end

template 'C:/Program Files (x86)/Mackerel/mackerel-agent/mackerel-agent.conf' do
  source 'mackerel-agent.conf.erb'
  owner 'Administrator'
  group 'Administrator'
  mode '0644'
end

directory 'C:/mackerel-scripts' do
  owner 'Administrator'
  group 'Administrator'
  mode '0755'
  action :create
end

node['mackerel-win']['scripts'].each do |script|
  cookbook_file "C:/mackerel-scripts/#{script}" do
    source script
    owner 'Administrator'
    group 'Administrator'
    mode '0755'
  end
end

service 'mackerel-agent' do
  service_name 'mackerel-agent'
  action [:restart]
end
