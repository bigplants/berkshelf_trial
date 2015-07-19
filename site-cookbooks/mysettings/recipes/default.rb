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
include_recipe "blackfire"

# install and start mysql
mysql_service 'default' do
  version '5.6'
  port '3306'
  initial_root_password ''
  action [:create, :start]
end

# install php packages
%w{php5-curl php5-mysql php5-imagick php5-xdebug php5-gd php5-mcrypt php5-oauth php5-redis php5-intl php-apc}.each do |php_pkg|
  package php_pkg
end

# install gem packages
%w{sass}.each do |gem_pkg|
  gem_package gem_pkg
end

# install apt packages
apt_packages = %w{libnotify-bin notify-osd}
apt_packages.each do |pkg|
  package pkg do
    options "-o Dpkg::Options::='--force-confold' -f --force-yes"
    action [:install, :upgrade]
  end
end
