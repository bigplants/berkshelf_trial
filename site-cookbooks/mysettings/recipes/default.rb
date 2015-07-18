#
# Cookbook Name:: mysettings
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#

# install and start mysql
mysql_service 'default' do
  version '5.6'
  port '3306'
  initial_root_password ''
  action [:create, :start]
end

# install gem package
%w{sass}.each do |package_name|
  gem_package package_name
end
