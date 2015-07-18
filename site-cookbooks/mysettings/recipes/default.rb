#
# Cookbook Name:: mysettings
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe "nginx"
include_recipe "php"
include_recipe "composer"
include_recipe "php-fpm"
include_recipe "php-mcrypt"
include_recipe "nodejs"
include_recipe "redisio"
include_recipe "redisio::enable"
include_recipe "ruby"

# install and start mysql
mysql_service 'default' do
  version '5.6'
  port '3306'
  initial_root_password ''
  action [:create, :start]
end

# install gem packages
%w{sass}.each do |gem_pkg|
  gem_package gem_pkg
end
