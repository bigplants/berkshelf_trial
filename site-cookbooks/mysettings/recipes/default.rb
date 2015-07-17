#
# Cookbook Name:: mysettings
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
mysql_service 'default' do
  version '5.6'
  # bind_address '127.0.0.1'
  port '3306'
  initial_root_password ''
  action [:create, :start]
end
