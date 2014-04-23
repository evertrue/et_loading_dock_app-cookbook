#
# Cookbook Name:: et_loading_dock_app
# Recipe:: default
#
# Copyright (C) 2013 EverTrue, Inc.
#
# All rights reserved - Do Not Redistribute
#

case node['platform_family']
when 'debian'
  include_recipe 'apt'
  package 'fontconfig'
end

package 'git'

include_recipe 'node'
include_recipe 'et_rails_app'
